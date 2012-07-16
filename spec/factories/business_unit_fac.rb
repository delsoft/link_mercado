
FactoryGirl.define  do
    
  factory :natural_person, class: BusinessUnit, aliases: [:business_unit] do    
    sequence(:name) {|n| "natural person #{n}"}
    cpf '00220449732'
    description 'this is a natural person named #{name}' 
    association :owner, factory: :user, strategy: :build
     
    business_group  
  end

  factory :legal_person, class: BusinessUnit do    
    sequence(:name) {|n| "legal person #{n}"}  
    description 'this is a legal person named #{name}'
    cnpj '03839889000193'
    association :owner, factory: :user, strategy: :build
    business_group
  end
end