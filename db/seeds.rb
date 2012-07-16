# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

<<<<<<< HEAD
if Rails.env.development? or Rails.env.test? then
=======

if Rails.env.development? then
>>>>>>> alterações de modelos
  
  if ProfessionalActivity.count == 0 then
    ProfessionalActivity.create  [
    {:name => 'Mudanças'},
    {:name => 'Adesivos'},
    {:name => 'Acumpuntura'},
    {:name => 'Auto-peças'},
    {:name => 'Escolas'}  
    ]
  end
    
  while BusinessUnit.count < 3 do
    FactoryGirl.create(:business_unit).save
  end
  
end

<<<<<<< HEAD
if Rails.env.development? then
=======
if Rails.env.development? or Rails.env.production? then
>>>>>>> alterações de modelos
  
  valid_ufs = %w(AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO BR)
  valid_ufs.each {|uf| s = State.create(:name => uf).save unless State.find_by_name(uf) }
    
end
