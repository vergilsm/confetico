$(document).ajaxSuccess(function (event, xhr, settings) {
    var respond = $.parseJSON(xhr.responseText);
    var cart_item = respond.cart_item;
    var quantity = cart_item.quantity;
    var cart_item_id = cart_item.id;
    // Цена за единицу товара
    var price = $('#price_cart_item_' + cart_item_id).text();

    // Цена нескольких единиц одного товара
    $('#subtotal_' + cart_item_id).text(cart_item.subtotal);

    // Сколько всего единиц одного товара
    var total_quantity_item = $('#total_quantity_item_' + cart_item_id).text();
    var num_quantity_item = Number(total_quantity_item);
    var now_quantity = $('#quantity_field_' + cart_item_id).val();

    if (now_quantity > num_quantity_item) {
      $('#limit_quantity_' + cart_item_id).fadeIn({duration: 1000});
      $('#limit_quantity_' + cart_item_id).fadeOut({duration: 4000});

      $('#quantity_field_' + cart_item_id).val(num_quantity_item);
    }

    // Общее количество товаров в корзине
    $("#total_items").text(cart_item.cart.total_items);

    // Общая сумма заказа
    $('#total_price').text(cart_item.cart.total_price);
});
