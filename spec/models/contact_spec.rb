require 'spec_helper'

describe FactoryGirl.build(:contact) do
  before(:each) do
    @c = FactoryGirl.create(:contact)
    @d = FactoryGirl.create(:contact)
  end
  
  context "create" do
    it { should be_valid }
    it { @c.should be_valid }
    it { @d.should be_valid }
    it { validate_presence(:contact, [:name, :business_unit_id]) }  
    
    it "deveria o 'name' ser unico no escopo de 'business_unit'" do
      
      (@d.business_unit_id != @c.business_unit_id).should be_true
      
      @d.business_unit_id = @c.business_unit_id
      @d.name = @c.name
      @d.should_not be_valid
      
      @d.name += 'x'
      @d.should be_valid
      
    end
    
    
    it "deveria o 'name' ser bem formatado" do
      @c.name = '     teste  da     silva   '
      @c.should be_valid
      @c.name.should === 'Teste da silva'
    end
    
  end
  
  context "aqssociations" do
    it { should belong_to(:business_unit)}
    it { should have_many(:emails)}
    it { should have_many(:phones)}
  end
  
end
