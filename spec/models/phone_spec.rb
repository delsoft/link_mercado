require 'spec_helper'

describe Phone do
  # before(:each) do
    # @p = FactoryGirl.build(:phone)  
  # end
#   
  context "create" do
    # it { @p.should be_valid }
    describe Phone do      
      it { validate_presence(:phone, [:number, :type_contact_id] ) }
      it { should validate_numericality_of(:number).only_integer }
    end
  end
  
  context "associations" do
    it {should belong_to(:contact) }
  end
  
  pending "como fazer uniqueness com escope contact_information??"
end
