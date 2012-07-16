require 'spec_helper'

describe BrandAvailable do
  before(:each) do
    @p = FactoryGirl.create(:brand_available)
  end
  
  context "create" do
    
    it { @p.valid?.should be_true }
    it { 
      validate_presence(:brand_available,[:description,:business_unit_id])
      }  
    
    it "should be unique per business unit" do
      p2 = BrandAvailable.new(business_unit_id: @p.business_unit.id, description: @p.description)
      p2.should_not be_valid
    end
    
  end
  
  context "associations" do
    it {should belong_to(:business_unit)}
  end
end
