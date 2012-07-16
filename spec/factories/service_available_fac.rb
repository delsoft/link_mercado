# encoding: utf-8

FactoryGirl.define do
  factory :service_available do
    sequence(:description) {|n|" Conserto de peças #{n}"}
    business_unit
  end
end