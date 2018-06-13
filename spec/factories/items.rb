FactoryBot.define do
  factory :item do
    association :category

    name "Шоколад молочный"
    weight 100
    price  90
    description 'good'
    picture nil
    quantity_item 20

    factory :item2 do
      association :category

      name "Шоколад пористый"
      weight 110
      price  70
      description 'good'
      picture nil
      quantity_item 15
    end
  end
end
