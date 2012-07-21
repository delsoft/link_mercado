FactoryGirl.define do
  factory :contact do
    sequence(:name) {|n| "contact name #{n}"}
    business_unit
  end
end