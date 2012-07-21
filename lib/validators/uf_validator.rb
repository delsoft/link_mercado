# encoding: utf-8
class UfValidator < ActiveModel::EachValidator
   def initialize(args)
     super(args)
     @valid_ufs = %w(AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO BR)  
   end
   
   def validate_each(record, attribute, value)
     
     return if value.blank?
          
     if ! @valid_ufs.include?(value.to_s.upcase) then
       record.errors.add(attribute, options[:message] || "UF inválido '#{value.to_s}'")
     else
       record[attribute.to_s] = value.upcase
     end
   end
end