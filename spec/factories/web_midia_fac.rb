FactoryGirl.define do
  factory :web_midia do
    
    sequence(:url) {|n| "http://www.google.com/q=#{n}"}
    type_web_midia
    business_unit
    
  end
  
end