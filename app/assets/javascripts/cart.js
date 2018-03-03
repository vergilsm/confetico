$(document).ajaxSuccess(function (event, xhr, settings) {
    var respond = $.parseJSON(xhr.responseText);
    var quantity = respond.quantity;
    var cart_item_id = respond.id;
    // Цена за единицу товара
    var price = $('#price_cart_item_' + cart_item_id).text();

    // Цена нескольких единиц одного товара
    $('#total_price_cart_item_' + cart_item_id).text(quantity * price);

    // Общее количество товаров в корзине
    var quantity_all = document.querySelectorAll('#quantity_field');
    var quantity_arr = Array.prototype.slice.call(quantity_all);
    var arr = quantity_arr.map(function (i) {
        return Number(i.value);
    });

    var total_items = arr.reduce(function (value, nextValue, index) {
        return value + nextValue
    });

    $("#total_items").text(total_items);

    // Общая сумма заказа
    var sub_total_arr = $('[id*=total_price_cart_item]').map(function () {
       return parseInt($(this).text());
    }).toArray();

    var sub_total = sub_total_arr.reduce(function (previousValue, currentItem, index) {
       return previousValue + currentItem
    });

    $('#sub_total').text(sub_total);
});
