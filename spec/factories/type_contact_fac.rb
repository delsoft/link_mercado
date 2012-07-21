FactoryGirl.define do
  factory :type_contact do
    sequence(:description){|n| "Type contact #{n}"}
    is_system false
  end
end