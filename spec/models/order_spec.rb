require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) {build(:order)}

  let(:item) {build(:item, id: 1)}
  let(:cart_item) {build(:cart_item, item_id: 1,)}
  let(:cart_item3) {build(:cart_item, quantity: 21, item_id: 1,)}

  it 'valid?' do
    expect(order.valid?).to eq true
  end

  context 'minus quantity item' do
    it 'if cart_item.quantity < item.quantity.item' do
      item.save
      cart_item.save
      item = cart_item.item

      item.quantity_item = item.quantity_item - cart_item.quantity
      item.save

      expect(item.quantity_item).to eq 19
    end

    it 'if cart_item.quantity > item.quantity.item' do
      item.save
      cart_item3.save
      item = cart_item3.item

      cart_item3.quantity = item.quantity_item
      item.quantity_item = item.quantity_item - cart_item3.quantity
      cart_item3.save

      expect(item.quantity_item).to eq 0
    end
  end
end
