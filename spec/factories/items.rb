FactoryBot.define do
  factory :item do
    association :category

    name "Шоколад молочный"
    weight 100
    price  90
    picture nil
    quantity_item 20
  end
end
