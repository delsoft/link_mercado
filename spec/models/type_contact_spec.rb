# encoding: utf-8
require 'spec_helper'

describe TypeContact do
  context "create" do
    before(:each) do
     @m = FactoryGirl.build(:type_contact)
    end
    
    it { @m.should be_valid }
    
    it { validate_presence(:type_contact, :description ) }
    
    it { validate_uniqueness(:type_contact, :description) }
    
    it "Deveria haver um valor padrão false para o campo 'is_system'" do
      @m.is_system.should be_false  
    end
    
  end
  
  context "associations" do
  end
  
end
