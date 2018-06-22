FactoryBot.define do
  factory :admin do
    email 'aaa@bbb.ccc'
    after(:build) {|u| u.password_confirmation = u.password = "123123"}
  end
end
