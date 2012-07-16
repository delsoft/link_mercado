require 'spec_helper'

describe ProductAvailable do
  
  before(:each) do
    @p = FactoryGirl.create(:product_available)
  end
  
  context "create" do
    
    it { @p.valid?.should be_true }
    it { 
      validate_presence(:product_available,[:description,:business_unit_id])
      }  
    
    it "should be unique per business unit" do
      p2 = ProductAvailable.new(business_unit_id: @p.business_unit.id, description: @p.description)
      p2.should_not be_valid
    end
    
  end
  
  context "associations" do
    it {should belong_to(:business_unit)}
  end
  
end
