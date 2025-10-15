function addToCart(){
    let quantity = document.getElementById('quantity-add-to-cart').value;
    let id = document.getElementById('product-id').value;

    window.location.href = '/cart/add/' + id + "/" + quantity;
}