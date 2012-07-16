FactoryGirl.define do
  factory :payment_method do
    sequence(:name) {|n| "payment method #{n}"}
  end
end