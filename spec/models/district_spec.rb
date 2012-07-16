require 'spec_helper'

describe District do
  
  context "create" do
     before(:each) do
       @d = FactoryGirl.create(:district)
       @e = FactoryGirl.create(:district)
     end
    
    it { 
      @d.should be_valid 
      @e.should be_valid 
      }
    
    it { validate_presence(:district, [:city_id, :name] ) }
    
    it "deveria o name ser unico no escopo de cidade" do
      @d.city_id = @e.city_id
      @d.name = @e.name
      @d.should_not be_valid
      
      @d.name += 'x'
      @d.should be_valid
      
    end
  end
  
  context "associations" do
    it {should belong_to(:city) }
    it {should have_many(:addresses) }
  end
  
end
