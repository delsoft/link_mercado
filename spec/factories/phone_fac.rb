FactoryGirl.define do
  factory :phone do
    sequence(:number) {|n| 86034900 + n }
    area_code 21
    extension ""
    type_contact
  end
end