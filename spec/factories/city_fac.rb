FactoryGirl.define do
  factory :city do
    sequence(:name) {|n| "cidade #{n}"}
    state
  end
end