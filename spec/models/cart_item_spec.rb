require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart_item) {create(:cart_item)}
  let(:cart_item2) {build(:cart_item, item_id: 1, quantity: 25)}
  let(:item) {build(:item, id: 1)}

  it "exists?" do
    expect(cart_item).to be_truthy
  end

  it 'total_price' do
    item.save
    cart_item.save
    total = cart_item.quantity * item.price

    expect(cart_item.total_price).to eq total
  end

  it 'limit quantity' do
    item.save

    expect(cart_item2.quantity > item.quantity_item).to be_truthy

    expect(cart_item2.limit_quantity).to eq item.quantity_item
  end
end
