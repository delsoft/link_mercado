# encoding: utf-8

FactoryGirl.define do
  factory :business_group  do
    #name 'grupo makro atacadista'
    sequence(:name) {|n| "legal person #{n}"}      
    description 'descrição grupo atacadista'
    association :owner, factory: :user, strategy: :build
  end
end

