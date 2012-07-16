require 'spec_helper'

describe State do
  context "create" do
    
    it { validate_presence(:state, [:name]) }  
    it { validate_uniqueness(:state, [:name]) }  
    
    describe "should be uf" do
      valid_ufs = %w(AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO BR)
      valid_ufs.each{|uf|
        it "'" + uf + "'" do
          State.create(:name => uf).save.should be_true
        end        
      }  
    end
    
    describe "should not be uf" do
      valid_ufs = ["RJ ", " SP", "X", 1]
      valid_ufs.each{|uf|
        it "'" + uf.to_s + "'" do
          State.create(:name => uf).save.should_not be_true
        end        
      }  
    end
    
  end
  
  context "associations" do
    it { should have_many(:cities) }
    it { should have_many(:addresses) }
  end
  
end
