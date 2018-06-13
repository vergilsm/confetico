require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) {create(:cart)}

  let(:item) {build(:item, id: 1)}
  let(:item2) {build(:item2, id: 2)}

  let(:cart_item) {build(:cart_item, item_id: 1,)}
  let(:cart_item2) {build(:cart_item, item_id: 2)}

  it "exists?" do
    expect(cart).to be_truthy
  end

  it "add item" do
    item.save

    cart.add_item(item)

    expect(cart.cart_items.length).to eq 1
  end

  it "sub total" do
    item.save
    cart_item.save

    cart.add_item(item)
    total_price = cart_item.quantity * item.price

    expect(cart.sub_total).to eq total_price
  end

  it "total items" do
    item.save
    item2.save
    cart_item.save
    cart_item2.save

    cart.add_item(item)
    cart.add_item(item2)

    cart_item_all_quantity = cart_item.quantity + cart_item2.quantity

    expect(cart.total_items).to eq cart_item_all_quantity
  end
end
