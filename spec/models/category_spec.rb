require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'creation Category' do
    category = create(:category)

    expect(category.product_category).to eq "Шоколад"
  end
end
