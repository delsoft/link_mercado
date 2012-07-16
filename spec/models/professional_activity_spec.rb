require 'spec_helper'

describe ProfessionalActivity , "professional activity" do
    
    context "create" do
      
      it { validate_presence(:professional_activity, [:name ] ) }
      it { validate_uniqueness(:professional_activity, [:name ] ) }
      
           
     # it { should validate_presence_of(:name) }
     # it { should validate_uniqueness_of(:name) }
    
    end
    
    context "associations" do
 
       it { should have_and_belong_to_many(:business_units) }      
      
    end
end
