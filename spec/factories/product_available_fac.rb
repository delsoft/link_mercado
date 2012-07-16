FactoryGirl.define do
  factory :product_available do
    sequence(:description) {|n|" brastemp #{n}"}
    business_unit
  end
end