

FactoryGirl.define  do
  factory :professional_activity do    
    sequence(:name) {|n| "Name_#{n}"}    
  end
end