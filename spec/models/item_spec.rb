require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) {build(:item)}
  let(:not_real_item) {build(:item, quantity_item: 0)}

  context "Item" do
    it "exists?" do
      expect(item).to be_truthy
    end

    it "real?" do
      expect(item.real_item).to be_truthy
    end

    it "not real?" do
      expect(not_real_item.real_item).to be_falsey
    end
  end
end
