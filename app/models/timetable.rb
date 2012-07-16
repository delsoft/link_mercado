# encoding: utf-8
class Timetable < ActiveRecord::Base
  attr_accessible :end_date, :end_time, :start_date, :start_time
 
  belongs_to :business_unit

  validates :business_unit_id, :presence => true
  validates :start_date, :presence => true
  validates :start_time, :presence => true
  
  validate :validate_date
  
  validate :validate_time
  
public

  def initialize(args=nil)
    super
    @lock = false
  end
  
  def start_date=(start_date)
    self[:start_date] = start_date
    check_duplicate_dates
  end
  
  def start_date
    self[:start_date]
  end
  
  def end_date=(end_date)
    self[:end_date] = end_date
    check_duplicate_dates
  end
  
  def end_date
    self[:end_date]
  end

   def humanize(breakline=' ')
     
     str = ""
     
     if ! start_date.blank? then
       str += @@AllDays[start_date]
       str += ' a ' + @@AllDays[end_date] unless end_date.blank?
     end
        
        # return "a"
    puts "str is nil == " + (str == nil).to_s
     
    return str if start_time.blank?
     
     str += breakline
    if end_time.blank? then
      str += 'apartir de ' + start_time    
    else
      str += 'de ' + start_time + ' até ' + end_time       
    end    
    str      
   end

 private
  
  @@Weekdays = { 'dom' => 'Domingo', 'seg' => 'Segunda', 'ter' => 'Terça', 'qua' => 'Quarta',  \
                 'qui' => 'Quinta', 'sex' => 'Sexta', 'sab' => 'Sábado' }
   
  @@SpecialDays = { 'fer' => 'Feriado', 'dia' => 'Diariamente' }
   
  @@AllDays = @@Weekdays.merge(@@SpecialDays)

  def check_duplicate_dates
     
    return if @lock == true
  
    @lock = true
    begin
      if start_date == end_date then
        self.start_date = 'dia' if @@Weekdays.include?(start_date)
        self.end_date = nil  
      end  
    ensure
      @lock = false
    end 
  end
  
  def validate_date
        
    @has_errors = false
    @valid_date_names = @@Weekdays.keys + @@SpecialDays.keys
    
    self.start_date = self.start_date.downcase if start_date.class == String
    self.end_date = self.end_date.downcase if end_date.class == String    
     
    def has_weekdays_xor_special_days 
      
      
      return true if start_date.blank? or end_date.blank?
         
      
      a = start_date
      b = end_date
      
      is_b_week = @@Weekdays.keys.include?(b)
      is_a_week = @@Weekdays.keys.include?(a)
      
      is_b_special = @@SpecialDays.keys.include?(b)
      is_a_special = @@SpecialDays.keys.include?(a)
      
      (is_b_week and is_a_week) ^ (is_a_special and is_b_special)
    end
    
    def has_valid_date field

      if(self.send(field).blank?) then
        return
      end
      
      fld = self.send(field).to_s
      
      if ! @valid_date_names.include?(fld) then
        errors.add(field, "Invalid #{field.to_s.humanize.downcase}")
        @has_errors = true
      end
    end   
          
    has_valid_date :start_date
    has_valid_date :end_date
            
    # otimização
    if @has_errors then
       return      
    end
    
    # não pode haver dias de semana e dias especiais simultaneamente
    if ! has_weekdays_xor_special_days then
      errors.add(:start_date, "you can not use both weekdays and special days in the date fields")
      errors.add(:end_date, "you can not use both weekdays and special days in the date fields")
    end
     
  end
  
  def validate_time
    
    def has_time_valid_format field
      fld = self.send(field) 

      return true if fld.nil?
      return false  unless fld =~ /^[0-9]{2}:[0-9]{2}$/   
      
      h = '';  m = '';
      fld.split(':').each{|i|  h=m; m=i; }
      
      h = h.to_i; m = m.to_i;
      
      return false if h < 0 or h > 23
      return false if m < 0 or m > 59
      return false if m.remainder(15) != 0
      
      true     
    end      
    
    # validar o formato da hora 99:99
    if ! has_time_valid_format :start_time then
      errors.add(:start_time, "time format is not valid")
    end

    if ! has_time_valid_format :end_time then
      errors.add(:end_time, "time format is not valid")
    end
    
  end
  
end
