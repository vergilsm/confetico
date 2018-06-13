FactoryBot.define do
  factory :cart_item do
    association :item
    association :cart

    cart_id 1
    quantity 1

    factory :cart_item2 do
      association :item
      association :cart

      cart_id 1
      quantity 1
    end
  end
end
