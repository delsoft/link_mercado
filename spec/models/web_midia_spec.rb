require 'spec_helper'

describe WebMidia do
  
  context "create" do
    it { validate_presence(:web_midia, [:url, :type_web_midia_id]) }
    it { validate_all_not_uniqueness(:web_midia) }
    
  end
  
  context "associations" do
    it { should belong_to(:business_unit) }
    it { should belong_to(:type_web_midia) }
  end
  
end
