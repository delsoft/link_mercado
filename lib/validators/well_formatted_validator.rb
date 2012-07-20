class WellFormattedValidator < ActiveModel::EachValidator
  
  def just(value, options=nil)
    
    #puts "---------"
    return value unless options and value
           
    #puts "options = #{options}"
    if options[:left_just] then
        opt = options[:left_just]
        value.ljust(opt[:lenght], opt[:char] || "0")
    elsif options[:right_just] then
        opt = options[:right_just]
        value.rjust(opt[:lenght], opt[:char] || "0")
    end   
    
    value
    
  end
  
  def validate_each(record, attribute, value)
    
    return unless value
    
    #puts "##########################################S"
    #puts "attribute=#{attribute.to_s}"
    #puts "value=#{value.to_s}"
    
    tmp = just(value.to_s.squish, options)
         
    if options[:with] == :downcase then
      tmp = tmp.downcase
    elsif options[:with] == :upcase then
      tmp = tmp.upcase
    elsif options[:with]  == :blank_only then
      //none
    else
      tmp = tmp.capitalize
    end
    
    record[attribute.to_s] = tmp
    
  end
  
  private
  
  
end


