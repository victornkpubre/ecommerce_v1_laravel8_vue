<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Product;
use App\Models\Processing;
use Illuminate\Http\Request;
use Cartalyst\Stripe\Laravel\Facades\Stripe;

class CartsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('pages.checkout');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(!$request->get('product_id')){
            return [
                'message' => 'Cart item returned',
                'items' => Cart::where('user_id', auth()->user()->id)->sum('quantity')
            ];
        }


        $productFoundInCart = Cart::where('product_id', $request->get('product_id'))->pluck('id');
        // return [ 
        //     "con" => $productFoundInCart->isEmpty(),
        //     "con2" => empty($productFoundInCart),

        // ];

        //Check user cart items
        $userItems = Cart::where('user_id', auth()->user()->id)->sum('quantity');


        if($productFoundInCart->isEmpty()){
            $product = Product::where('id', $request->get('product_id'))->first();
            //return $product->id;
            Cart::create([
                'product_id' => $product->id,
                'quantity' => 1,
                'price' => $product->sale_price,
                'user_id' => auth()->user()->id,
            ]);
            return [
                'message' => 'Cart Updated',
                'items' => $userItems
            ];
        }else{
            Cart::where('product_id', $request->get('product_id'))->increment('quantity');
            return [
                'message' => 'Cart Product Incremented',
                'items' => $userItems
            ];
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function getCartItemsForCheckout(){
        $cartItems = Cart::where('user_id', auth()->user()->id)->get();
        $finalData = [];
        $amount = 0;

        if(isset($cartItems)){
            foreach($cartItems as $cartItem){
                if($cartItem->product){
                    
                    foreach($cartItem->product as $cartProduct){
                        if($cartProduct->id == $cartItem->product_id){
                            // return $cartProduct->name;
                            // var_dump($cartProduct->quantity);
                            $finalData[$cartItem->product_id]['id'] = $cartProduct->id;
                            $finalData[$cartItem->product_id]['name'] = $cartProduct->name;
                            $finalData[$cartItem->product_id]['quantity'] = $cartItem->quantity;
                            $finalData[$cartItem->product_id]['sale_price'] = $cartItem->price;
                            $finalData[$cartItem->product_id]['total'] = $cartItem->price * $cartItem->quantity;

                            $amount+=$finalData[$cartItem->product_id]['total'];
                            $finalData['totalAmount'] = $amount;
                        }
                    }

                    // var_dump($cartItem->product_id);
                }

            }
        }
        return response()->json($finalData);
    }

    public function processPayment(Request $request){
        $country = $request->get('country');
        $firstName = $request->get('firstName');
        $lastName = $request->get('lastName');
        $address = $request->get('address');
        $city = $request->get('city');
        $state = $request->get('state');
        $zipCode = $request->get('zipCode');
        $email = $request->get('email');
        $phone = $request->get('phone');

        $cardName = $request->get('cardName');
        $cardNumber = $request->get('cardNumber');
        $expirationMonth = $request->get('expirationMonth');
        $expirationYear = $request->get('expirationYear');
        $cvc = $request->get('cvc');

        $amount = $request->get('amount');
        $orders = $request->get('order');
        $orderArray = [];
        foreach($orders as $order){
            if(!is_int($order)){
                $orderArray[$order['id']]['order_id'] = $order['id'];
                $orderArray[$order['id']]['quantity'] = $order['quantity'];
            }
        }


        // return $request->all();
        
        //Process Payment
        $stripe = Stripe::make('sk_test_51KlX67LSwbaFo618YZLhfuRQBJ5bBIwIhsrZs8SAkRk1XNtakzoId2KHngpVp1JNcoG3TU9dJtodlJsb26fPf01c007sTDEqj5');
        $token = $stripe->tokens()->create([
            'card' => [
                'number' =>  '4242 4242 4242 4242',
                'exp_month' => $expirationMonth,
                'exp_year' => $expirationYear,
                'cvc' => $cvc,
            ]
        ]);
        if(!$token['id']){
            session()->flush('error', 'Stripe Token Generation Failed');
            return;
        }

        //Create a customer stripe
        $customer = $stripe->customers()->create([
            'name' => $firstName.' '.$lastName,
            'email' => $email,
            'phone' => $phone,
            'address' => [
                'line1' => $address,
                'postal_code' => $zipCode,
                'city' => $city,
                'state' => $state,
                'country' => $country,
            ],
            'shipping' => [
                'name' => $firstName.' '.$lastName,
                'address' => [
                    'line1' => $address,
                    'postal_code' => $zipCode,
                    'city' => $city,
                    'state' => $state,
                    'country' => $country,
                ],
            ],
            'source' => $token['id'],
        ]);

        //Charge Client
        $charge = $stripe->charges()->create([
            'customer' => $customer['id'],
            'currency' => 'USD',
            'amount' => $amount,
            'description' => 'Payment for Order',
        ]);

        if($charge['status'] == 'succeeded'){
            $customerIdStripe = $charge['id'];
            $amountRec = $charge['amount'];
            $client_id = auth()->user()->id;
            
            
            $processingDetails = Processing::create([
                'client_id' => $client_id,
                'client_name' => $firstName.' '.$lastName,
                'client_address' => json_encode([
                    'line1' => $address,
                    'postal_code' => $zipCode,
                    'city' => $city,
                    'state' => $state,
                    'country' => $country,
                ]),
                'order_details' => json_encode($orderArray),
                'amount' => $amount,
                'currency' => $charge['currency'],
            ]);

            
            if($processingDetails){
                //Clear the cart after payment success
                
                Cart::where('user_id', $client_id)->delete();
                return ['success' => 'Order Completed Successfully'];
            }
            else{
                return ['error' => 'Order failed'];
            }

        }else{

        }


    }


}


