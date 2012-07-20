FactoryGirl.define do
  factory :address do
    city
    state
    district
    sequence(:additional_address) {|n| "Additional address  #{n}"}
    house_number '99-b'
    zip_code '23075305'
  end
end