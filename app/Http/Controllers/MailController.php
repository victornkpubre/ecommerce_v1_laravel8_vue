<?php

namespace App\Http\Controllers;
use App\Mail\ContactMail;
use App\Mail\CheckoutMail;
use Illuminate\Http\Request;
use App\Mail\ContactMailResponse;
use App\Mail\CheckoutMailResponse;
use Illuminate\Support\Facades\Mail;
use App\Http\Requests\ContactFormRequest;

class MailController extends Controller
{
    //Mail to Company
    public function sendContactEmail(ContactFormRequest $request){
        $data = $request->validated();
        $details = [
            'name' => $data['name'],
            'email' => $data['email'],
            'message' => $data['message']
        ];


        //Mail to Company
        Mail::to('fingerfoodappdevelopment@gmail.com')->send(new ContactMail($details));

        //Mail to Customer
        Mail::to($details['email'])->send(new ContactMailResponse($details));
        
        return "Email Sent";
    }


    
    public function sendCheckoutEmail(Request $request){
        $orders = $request->get('items');
        $orderArray = [];
        $orderTotal = $orders['totalAmount'];
        $user = $request->get('user');
        foreach($orders as $order){
            if(!is_int($order)){
                $orderArray[$order['id']]['name'] = $order['name'];
                $orderArray[$order['id']]['quantity'] = $order['quantity'];
                $orderArray[$order['id']]['total'] = $order['total'];
            }
        }

        //Mail to Company
        Mail::to('fingerfoodappdevelopment@gmail.com')->send(new CheckoutMail($orderArray, $orderTotal, $user));

        //Mail to Customer
        Mail::to($user['email'])->send(new CheckoutMailResponse($orderArray, $orderTotal, $user));

        return "Email Sent";

    }


}
