FactoryGirl.define do
  factory :timetable do
    start_date "seg"
    end_date "sex"
    start_time "09:00"
    end_time "18:00"
    business_unit
  end
end