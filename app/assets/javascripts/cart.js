$(document).ajaxSuccess(function (event, xhr, settings) {
    var respond = $.parseJSON(xhr.responseText);
    var quantity = respond.quantity;
    var cart_item_id = respond.id;
    // Цена за единицу товара
    var price = $('#price_cart_item_' + cart_item_id).text();

    // Цена нескольких единиц одного товара
    $('#subtotal_cart_item_' + cart_item_id).text(quantity * price);

    // Сколько всего единиц одного товара
    var total_quantity_item = $('#total_quantity_item_' + cart_item_id).text();

    var form = document.querySelector('#form_' + cart_item_id);

    $('#form_' + cart_item_id).click(function() {
      if (quantity > total_quantity_item) {
        $('.show_limit_quantity_item').slideIn({duration: 1000});
        $('.show_limit_quantity_item').fadeOut({duration: 4000});
      }
        quantity = total_quantity_item;
    });

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
    var total_price_arr = $('[id*=total_price_cart_item]').map(function () {
       return parseInt($(this).text());
    }).toArray();

    var total_price = total_price_arr.reduce(function (previousValue, currentItem, index) {
       return previousValue + currentItem
    });

    $('#total_price').text(total_price);
});
