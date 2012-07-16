# encoding: utf-8
class State < ActiveRecord::Base
  attr_accessible :name
  
  has_many :cities
  has_many :addresses
  
  validates :name, :presence => true, :uniqueness => true
  
  validate :validate_uf_br  
  
  def name=(name)    
    self[:name] = name.to_s.upcase    
  end
  
  def name
    self[:name]
  end
    
 private
 
 def validate_uf_br
   
   return if name.blank?
   
   valid_ufs = %w(AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO BR)
   if ! valid_ufs.include?(name.to_s) then
     errors.add(:name, "UF inválido")
   end
 end
  
end
