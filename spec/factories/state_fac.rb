FactoryGirl.define do
    
  factory :state do        
    sequence(:name) {|n|   %w(AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO BR)[n] } 
  end
  
end