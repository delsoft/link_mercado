require 'spec_helper'

describe Email do
  
  pending "como testar e oimplementar uniqueness para email scoped contact_information ?"
  
  before(:each) do
    @e = FactoryGirl.build(:email)
  end
  
  context "create" do
    it{ @e.should be_valid }
    
    it { validate_presence(:email, [:address, :type_contact_id, :contact_id ]) }  
    it { validate_all_not_uniqueness(:email) }  
    
  end

  context "associoations" do
    it {should belong_to(:type_contact) }  
    it {should belong_to(:contact) }  
  end
    
end
