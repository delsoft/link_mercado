require 'spec_helper'

describe Timetable do
  
  context "create" do
  
    before(:each) do
      @timetable = FactoryGirl.create(:timetable)  
    end
    
    it { validate_presence(:timetable, [:start_date, :start_time, :business_unit_id] ) }  

    it "should not be date mixed values of weekdays and special days" do
      
      @timetable.should be_valid
      
      @timetable.start_date = 'seg'
      @timetable.end_date = 'fer'
      
      @timetable.should_not be_valid
      
      @timetable.start_date = 'fer'
      @timetable.end_date = 'seg'

      @timetable.should_not be_valid
      
    end
    
    it "should not be both dates with identical values" do
      
      @timetable.should be_valid
      
      @timetable.start_date = 'fer'
      @timetable.end_date = 'fer'
      
        
      @timetable.should be_valid
   
      @timetable.start_date.should === 'fer'
      @timetable.end_date.should be_blank
      
      @timetable.start_date = 'seg'
      @timetable.end_date = 'seg'
      
      @timetable.should be_valid
      
      @timetable.start_date.should === 'dia'
      @timetable.end_date.should be_blank
     
    end
    
    describe "should be valid date" do
      it { @timetable.should be_valid }
      
      valid_values = ['Seg','tEr', 'quA','QUI','sex','sab','dom','fer','dia']
      
      valid_values.each {|valid_item| 
        it "'" + valid_item + "'" do
          @timetable.end_date = nil
          @timetable.start_date = valid_item
          @timetable.should be_valid          
          @timetable.start_date.should === valid_item.downcase
        end
        }
                    
    end
    
    describe "should not be valid date" do
      it { @timetable.should be_valid }
      
      some_invalid_values = ['xxx','eg', 1]
            
      some_invalid_values.each {|invalid_item| 
        
        it "'" + invalid_item.to_s + "'" do
          @timetable.start_date = invalid_item
          @timetable.should_not be_valid
        end
        }
              
    end
    
    describe "should be valid time format" do
      
      it { @timetable.should be_valid }
      
      valid_values = ['00:00', '23:45', '01:30', '11:45']
      
       valid_values.each {|valid_item| 
        it valid_item do
        @timetable.start_time = valid_item
        @timetable.should be_valid
        end
        }
            
    end
    
    describe "should not be valid time format" do
      
      it { @timetable.should be_valid }
      
      some_invalid_values = [' 00:00', '23:45 ', '01:01:01', '24:60','000:000','2323:455', 'a0:00', '00:b0']
            
      some_invalid_values.each {|invalid_item|         
        it "'" + invalid_item + "'" do
          @timetable.start_time = invalid_item
          @timetable.should_not be_valid
        end
        }
      
    end
  end
  
  context "associations" do
    it { should belong_to(:business_unit) }
  end
  
end
