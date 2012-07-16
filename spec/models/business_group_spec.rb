# encoding: utf-8

require 'spec_helper'

describe BusinessGroup , "business group" do
    
    context "create" do
      
      it { validate_presence(:business_group, [:name, :owner]) }
      it { validate_uniqueness(:business_group, [:name]) }
      
    end
    
    context "associations" do      
      it {should have_many :business_units }
    end
end
    