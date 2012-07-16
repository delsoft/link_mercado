# encoding: utf-8
require 'spec_helper'

describe City do
  
   before(:each) do
     @c = FactoryGirl.create(:city)
     @d = FactoryGirl.create(:city, :state_id => @c.state_id ) 
   end

  context "create" do
    it "deveria ser válida a cidade" do
      @c.should be_valid
      @d.should be_valid      
    end
    
    it { validate_presence(:city, :state_id, {:ignore_attributes => :name })}
    it { validate_presence(:city, :state_id, {:ignore_attributes => :name })}
          
    it "deveria o name ser unico no escopo estado" do
      @c.state_id = @d.state_id
      @c.name = @d.name
      @c.should_not be_valid
        
      @c.name += 'xx'
      @c.should be_valid
          
    end
  end
  
  context "associations" do
    it { should have_many(:addresses) }
    it { should have_many(:districts) }
    it { should belong_to(:state) }
  end
end
