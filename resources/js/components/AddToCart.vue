<template>
    <div>
        <hr>
        <button class="btn btn-warning text-center" v-on:click.prevent="addProductToCart()">
            Add To Cart
        </button>
    </div>
</template>

<script>
    export default {
        data(){
            return  {
                count : 0
            }
        },
        props:['productId', 'userId'],
        methods:{
            async addProductToCart(){
                alert(this.userId);
                alert(this.productId);
                
                if(this.userId == 0){
                    this.$toastr.e('You need to Login to Add to Cart');
                    return;
                }
                let response = await axios.post('/cart', {
                    'product_id' : this.productId
                });

                this.$root.$emit('changeInCart', response.data.items);

            }
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
