# encoding: utf-8

class BusinessUnit < ActiveRecord::Base
  attr_accessible :business_group_id, :cnpj, :cpf, :description, :name, :owner
  

  belongs_to :business_group, :dependent => :destroy
  has_and_belongs_to_many :professional_activities
  has_and_belongs_to_many :payment_methods  
  has_and_belongs_to_many :addresses   
  has_many :timetable, :dependent => :destroy
  has_many :product_availables, :dependent => :destroy
  has_many :service_availables, :dependent => :destroy
  has_many :brand_availables, :dependent => :destroy
  
  validates_presence_of :business_group_id
  validates :name, :uniqueness => true, :presence => true
  validates :owner, :presence => true
  
  validate :exclusive_cnpj_or_cpf
   
  validates_as_cnpj :cnpj, :allow_blank => true
  
  validates_as_cpf :cpf, :allow_blank => true
  
  before_validation :ensure_has_owner 
  
  private
  
  def ensure_has_owner
      return if owner
      #owner = current_user
      #  pra teste sem logar
      self[:owner] = User.first unless owner    
  end
    
  def exclusive_cnpj_or_cpf
    if not cnpj.blank? and not cpf.blank? then
      errors.add(:cpf, 'Não é possível usar cpf e cnpj simultaneamente')
      errors.add(:cnpj, 'Não é possível usar cpf e cnpj simultaneamente')
    end
    
  end
end
