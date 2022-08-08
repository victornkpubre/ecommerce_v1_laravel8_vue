<template>
    <div>
        <div class="container checkoutBox">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
                    <div class="box">
                        <h3 class="box-title">Select Your Hosting Plan</h3>
                        <div class="plan-selection" v-for=" item in items" :key="item.id">
                            <div class="plan-data">
                                <input id="question1" name="question" type="radio" class="with-font" value="sel" />
                                <label for="question1">{{item.name}}</label>
                                <p class="plan-text">
                                    Quantity: {{item.quantity}}</p>
                                <span class="plan-price">
                                    Price: {{item.sale_price}}
                                </span>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
                
                    <div class="widget">
                        <h4 class="widget-title">Order Summary</h4>
                        <div class="summary-block" v-for=" summaryItem in items" :key="summaryItem.id">
                            <div class="summary-content" v-if="summaryItem.name">
                                <div class="summary-head"><h5 class="summary-title"> {{summaryItem.name}} </h5></div>
                                <div class="summary-price">
                                    <p class="summary-text">
                                        $ {{ summaryItem.total }} 
                                    </p>
                                    <span class="summary-small-text pull-right">
                                        Q: {{ summaryItem.quantity }} x
                                        P: {{ summaryItem.sale_price }} 
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="summary-block">
                            <div class="summary-content">
                               <div class="summary-head"> <h5 class="summary-title">Total</h5></div>
                                <div class="summary-price">
                                    <p class="summary-text"> $ {{items.totalAmount}} </p>
                                    <!-- <span class="summary-small-text pull-right">1 month</span> -->
                                </div>
                                <div class="text-right">
                                    <hr>
                                    <button class="btn btn-warning">Place Order</button>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
                    <div class="box">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card bg-default">
                                        <div class="card-header thin-card-header">
                                            <div class="card-title">
                                                <h3 class="box-title mb-0">Payment Details</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">



                                            <!-- CHECKOUT FORM -->
                                            <form class="form-horizontal" role="form">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <h3>Shipping/Billing Address</h3>
                                                        <hr>
                                                        <!-- Text input-->
                                                        <div class="form-group">
                                                            <label class="control-label" for="textinput">Country</label>
                                                            <input type="text" name="country" placeholder="Country" v-model="country" class="form-control">
                                                        </div>
                                                        <!-- Text input-->
                                                        <div class="form-group">
                                                            <label class="control-label" for="textinput">First Name</label>
                                                            <input type="text" name="first_name" placeholder="First Name" v-model="firstName" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label" for="textinput">Last Name</label>
                                                            <input type="text" name="last_name" placeholder="Last Name" v-model="lastName" class="form-control">
                                                        </div>
                                                        <!-- Text input-->
                                                        <div class="form-group">
                                                            <label class="control-label" for="textinput">Address</label>
                                                            <input type="text" name="address" placeholder="Address" v-model="address" class="form-control">
                                                        </div>

                                                        <!-- Text input-->
                                                        <div class="form-group">
                                                            <label class="control-label" for="textinput">City</label>
                                                            <input type="text" name="city" placeholder="City" v-model="city" class="form-control">
                                                        </div>
                                                        <!-- Text input-->
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label" for="textinput">State</label>
                                                                    <input type="text" name="state" placeholder="State" v-model="state" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label" for="textinput">Zip/Postcode</label>
                                                                    <input type="text" name="zip_code" placeholder="Post Code" v-model="zipCode" class="form-control">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Text input-->
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label" for="textinput">Phone Number</label>
                                                                    <input type="text" name="phone_number" placeholder="Phone Number" v-model="phone" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label" for="textinput">Email Address</label>
                                                                    <input type="text" name="email_address" placeholder="Email Address" v-model="email" class="form-control">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 col-md-12">
                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                <div class="row pt-3">
                                                                    <div class="col col-md-12">
                                                                        <h3>Payment</h3>
                                                                        <hr>
                                                                        <div class="inlineimage"> <img class="img-responsive images" src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Mastercard-Curved.png"> <img class="img-responsive images" src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Discover-Curved.png"> <img class="img-responsive images" src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Paypal-Curved.png"> <img class="img-responsive images" src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/American-Express-Curved.png"> </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div>
                                                                    <div class="col-xs-12">
                                                                        <div class="form-group"> <label>CARD NAME</label> <input type="text" class="form-control" v-model="cardName" name="card_name" placeholder="Card Name" /> </div>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div class="col-xs-12">
                                                                        <div class="form-group"> <label>CARD NUMBER</label>
                                                                            <div class="input-group"> <input type="tel" v-model="cardNumber" name="card_number" class="form-control w-100" placeholder="Valid Card Number" /> <span class="input-group-addon"><span class="fa fa-credit-card"></span></span> </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div class="col-xs-4 col-md-4 p-0">
                                                                        <div class="form-group"> <label>EXPIRATION MONTH</label> <input v-model="expirationMonth" type="tel" class="form-control" placeholder="Month" /> </div>
                                                                    </div>
                                                                    <div class="col-xs-4 col-md-4 p-0">
                                                                        <div class="form-group"> <label>EXPIRATION YEAR</label> <input v-model="expirationYear" type="tel" class="form-control" placeholder="Year" /> </div>
                                                                    </div>
                                                                    <div class="col-xs-4 col-md-4 p-0">
                                                                        <div class="form-group"> <label>CVC CODE</label> <input name="cvc" type="tel" v-model="cvc" class="form-control" placeholder="CVC" /> </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel-footer">
                                                            <div class="row">
                                                                <div class="col-xs-12 mt-4"> <button v-on:click.prevent="getUserAddress()" class="btn btn-success btn-lg btn-block">Confirm Payment</button> </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return {
            items : [],
            country: '',
            firstName: '',
            lastName: '',
            address: '',
            city: '',
            state: '',
            zipCode: '',
            email: '',
            phone: '',

            cardName: '',
            cardNumber: '',
            expirationMonth: '',
            expirationYear: '',
            cvc: '',
            
        }
    },
    methods: {
        async getCartItems(){
            let response = await axios.get('/checkout/get/items');
            this.items = response.data;
            console.log(this.items);
        },
        async getUserAddress(){
            //Process Payment
            let response = await axios.post('/process/user/payment', {
                'country': this.country ,
                'firstName': this.firstName ,
                'lastName': this.lastName ,
                'address': this.address ,
                'city': this.city ,
                'state': this.state ,
                'zipCode': this.zipCode ,
                'email': this.email ,
                'phone': this.phone ,

                'cardName': this.cardName ,
                'cardNumber': this.cardNumber ,
                'expirationMonth': this.expirationMonth ,
                'expirationYear': this.expirationYear ,
                'cvc': this.cvc ,
                'amount': this.items.totalAmount,
                'order' : this.items,
            });

            if(response.data.success){
                this.$toastr.s(response.data.success);
            }else{
                this.$toastr.s(response.data.error);
            }

            //Send Checkout Mail
            axios.post('/send/checkout-email', {
                'items' : this.items,
                'user' : {
                    'name' : this.firstName + ' ' + this.lastName,
                    'email' : this.email,
                    
                }
            });


            // setTimeout(() => {
            //     window.location.href = '/';
            // }, 2500);
            console.log(response.data);
        },

        
    },
    created(){
        this.getCartItems();
    }

}
</script>