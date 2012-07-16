require 'spec_helper'

describe TypeWebMidia do
  
  context "create" do
    
    it { validate_presence(:type_web_midia, [:name]) }
    it { validate_uniqueness(:type_web_midia, [:name]) }    
    
  end
  
  context "associations" do
    it { should belong_to(:web_midia) }
  end
  
end
