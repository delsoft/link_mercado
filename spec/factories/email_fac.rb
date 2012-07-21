FactoryGirl.define do
  factory :email do
    sequence(:address) {|n| "name#{n}@telelistas.net" }
    type_contact
    contact
  end
end