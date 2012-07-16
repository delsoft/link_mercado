# encoding: utf-8

FactoryGirl.define  do
  factory :user do
    sequence(:name) {|n| "Joao #{n}"}  
    password '123'
    sequence(:email) {|n| "Joao_#{n}@telelistas.net"}  
    
  end
end