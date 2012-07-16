# encoding: utf-8

FactoryGirl.define do
  factory :brand_available do
    sequence(:description) {|n|" Nike #{n}"}
    business_unit
  end
end