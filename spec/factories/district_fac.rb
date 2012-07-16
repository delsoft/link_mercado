FactoryGirl.define do
  factory :district do
    sequence(:name) {|n| "Cidade #{n}" }
    city
  end
end