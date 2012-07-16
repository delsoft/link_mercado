require 'spec_helper'

describe BusinessUnit do
   before(:each) do
      @l = FactoryGirl.create(:legal_person)    
      @n = FactoryGirl.create(:natural_person)   
   end
          
    context "create" do
      
      it { validate_presence(:legal_person, [:business_group_id, :name, :owner]) }
      it { validate_uniqueness(:business_unit, [:name]) }            
      
      it "should be exclusively cnpj or cpf" do    
          @l.should be_valid
          @l.cpf = @n.cpf
          @l.should_not be_valid
                      
          @n.should be_valid
          @n.cnpj = @l.cnpj
          @n.should_not be_valid                  
       end

     it "should be blank cnpj and cpf" do   
          
          #  Testing natural person
          #  preconditions, for a valid registry
          @n.cnpj.should be_blank          
          @n.cpf.should_not be_blank
          @n.should be_valid
          
          # both empty
          @n.cpf = nil
          @n.should be_valid
          
          # testing legal person
          # preconditions, for a valid registry
          @l.cpf.should be_blank
          @l.cnpj.should_not be_blank          
          @l.should be_valid
          
          #both emptyl
          @l.cnpj = nil
          @l.should be_valid
        end    
                   
    end
    
    context "associations" do
       
        it { should have_and_belong_to_many(:professional_activities) }
        it { should have_and_belong_to_many(:payment_methods) }
        it { should belong_to :business_group }  
        it { should have_many :timetable }  
        it { should have_and_belong_to_many(:addresses) }
     
    end

end
