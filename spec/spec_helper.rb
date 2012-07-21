# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
#require 'string_extensions'
require 'active_support/inflector'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
  
  #  Configurações do DatabaseCleaner  
  #  incluido por Nardele em 29/06/12 (vide Gem 'database_cleaner')
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  #  fim de databasecleaner - Nardele
  
end

# def validate_presence_of(symbol, presence_flds)
  # # validate_presence_of(symbol, presence_flds, [])
# end

#def validate_presence_of(symbol, presence_flds, ignore_flds)

def validate_all_not_uniqueness(symbol, options={})
  validate_uniqueness(symbol, [], options)
end

def validate_uniqueness(symbol, presence_flds, options={})

  raise "RSpec not found, are you using block ''it''? " unless respond_to?('validate_presence_of')
  raise "invalid options, it's a hash?" unless options.instance_of?(Hash)
  #raise "invalid presence_flds, it's a array of fields name?" unless presence_flds.instance_of?(Array)
  
  model = FactoryGirl.create(symbol)
  
  model.should be_valid
  
  
  scope = options[:scoped_to]
  
   
  
  tmp = []        
  
  presence_flds = [] << presence_flds unless presence_flds.class == Array  
  presence_flds.each{|k| tmp << k.to_s }      
  presence_flds = tmp
  
  ignore_flds = []
  if options.has_key?(:ignore_attributes) then
    options[:ignore_attributes].each{|k| ignore_flds << k.to_s } 
  end
  
  all_attr = model.attributes.keys -  ["id","created_at","updated_at"] - ignore_flds
  
  pres_attr = presence_flds
  
  not_pres_attr = all_attr - pres_attr
   
   if scope then
      return 
      
       # (@d.business_unit_id != @c.business_unit_id).should be_true
#       
      # @d.business_unit_id = @c.business_unit_id
      # @d.name = @c.name
      # @d.should_not be_valid
#       
      # @d.name += 'x'
      # @d.should be_valid
#       
     model2 = model = FactoryGirl.create(symbol)
     model2.should be_valid
     
     
     scope = [] << scope unless scope.class == Array
     
     # os dois modelos devem representar escopos diferentes
     scope.each{|fld| 
       a = model.send(fld.to_s);
       b = model2.send(fld.to_s)
       a.should != b
       }
   
     # testando presença no mesmo escopo
     model.save.should be_true
      pres_attr.each{fld| 
        model.send("{#fld.to_s}=", model2.send("#{fld.to_s}") )
        }
   
   else
     
     pres_attr.each{ |k| should validate_uniqueness_of(k.to_sym) }
   
     not_pres_attr.each{ |k| should_not validate_uniqueness_of(k.to_sym) }
     
   end
end

=begin
 def validate_uniqueness(symbol, presence_flds, options={})

  raise "RSpec not found, are you using block ''it''? " unless respond_to?('validate_presence_of')
  raise "invalid options, it's a hash?" unless options.instance_of?(Hash)
  #raise "invalid presence_flds, it's a array of fields name?" unless presence_flds.instance_of?(Array)
  
  model = FactoryGirl.create(symbol)
  
  model.should be_valid
  
  tmp = []        
  
  presence_flds = [] << presence_flds unless presence_flds.class == Array  
  presence_flds.each{|k| tmp << k.to_s }      
  presence_flds = tmp
  
  ignore_flds = []
  if options.has_key?(:ignore_attributes) then
    options[:ignore_attributes].each{|k| ignore_flds << k.to_s } 
  end
  
  all_attr = model.attributes.keys -  ["id","created_at","updated_at"] - ignore_flds
  
  pres_attr = presence_flds
  
  not_pres_attr = all_attr - pres_attr
   
  pres_attr.each{ |k|
    should validate_uniqueness_of(k.to_sym)
  }
   
  not_pres_attr.each{ |k|
    should_not validate_uniqueness_of(k.to_sym)
  }
   
end
 
=end
 
def validate_presence(symbol, presence_flds, options={})

  raise "RSpec not found, are you using block ''it''? " unless respond_to?('validate_presence_of')
  raise "invalid options, it's a hash?" unless options.instance_of?(Hash)
  #raise "invalid presence_flds, it's a array of fields name?" unless presence_flds.instance_of?(Array)
  
  model = FactoryGirl.create(symbol)
  
  model.should be_valid
  tmp = []
  
  presence_flds = [] << presence_flds unless presence_flds.class == Array
  
  presence_flds.each{|k| tmp << k.to_s }
      
  presence_flds = tmp
  
  ignore_flds = []
  if options.has_key?(:ignore_attributes) then
    ign = options[:ignore_attributes]
    ign = [] << ign unless ign.class == Array
    ign.each{|k| ignore_flds << k.to_s } 
  end
  
  all_attr = model.attributes.keys -  ["id","created_at","updated_at"] - ignore_flds
  
  pres_attr = presence_flds
  
  not_pres_attr = all_attr - pres_attr
  
  if options.has_key?(:scoped_to) then
    
    pres_attr.each{ |k|
      should validate_presence_of(k.to_sym)
    }
   
    not_pres_attr.each{ |k|
      should_not validate_presence_of(k.to_sym)
    }
  
  else   
    pres_attr.each{ |k|
      should validate_presence_of(k.to_sym)
    }
   
    not_pres_attr.each{ |k|
      should_not validate_presence_of(k.to_sym)
    }
  end 
end

def validate_valid_values(symbol, attribute, options={})

  puts "------------------------------"
  puts "options #{options.inspect}"
  puts "symbol #{symbol.inspect}"
  puts "attribute #{attribute.inspect}"
  
  options = [] << options unless options.class == Hash
  
  raise "Nenhum valor para checar, verifique :valid_values e :invalid_values" unless options[:valid_values] or options[:invalid_values]
  raise "RSpec not found, are you using block ''it''? " unless respond_to?('validate_presence_of')
  raise "invalid options, it's a hash?" unless options.instance_of?(Hash)
  
  model = FactoryGirl.create(symbol.to_sym)
  
  model.should be_valid
  
  tmp = []
  
  attribute = attribute.to_sym
  
  valid_values = options[:valid_values] || []
  invalid_values = options[:invalid_values] || []
  
  
  
  
  valid_values = [] << valid_values unless  valid_values.class == Array
  invalid_values = [] << invalid_values unless invalid_values.class == Array 
    
  valid_values.each{ |k|
      model.send("#{attribute}=", k)
      model.should be_valid
    }
  
  invalid_values.each{ |k|
      puts k.class
      model.send("#{attribute}=", k)
      puts "     .attribute = #{k}"
      puts "      model.attribute = #{model.send(attribute.to_s)}"
      model.should_not be_valid
    }
    
end

=begin
 def validate_presence(symbol, presence_flds, options={})

  raise "RSpec not found, are you using block ''it''? " unless respond_to?('validate_presence_of')
  raise "invalid options, it's a hash?" unless options.instance_of?(Hash)
  raise "invalid presence_flds, it's a array of fields name?" unless presence_flds.instance_of?(Array)
  
  model = FactoryGirl.create(symbol)
  
  model.should be_valid
  tmp = []
        
  presence_flds.each{|k| tmp << k.to_s }
      
  presence_flds = tmp
  
  ignore_flds = []
  if options.has_key?(:ignore_attributes) then
    options[:ignore_attributes].each{|k| ignore_flds << k.to_s } 
  end
  
  all_attr = model.attributes.keys -  ["id","created_at","updated_at"] - ignore_flds
  
  pres_attr = presence_flds
  
  not_pres_attr = all_attr - pres_attr
   
  pres_attr.each{ |k|
    should validate_presence_of(k.to_sym)
  }
   
  not_pres_attr.each{ |k|
    should_not validate_presence_of(k.to_sym)
  }
   
end
 
=end

=begin
def validate_has_and_belong_to_many(symbol1, symbol2)
  
  raise "RSpec not found, are you using block ''it''? " unless respond_to?('validate_presence_of')

  
  symbolName1 = symbol1.to_s
  symbolName2 = symbol2.to_s
  
  methodName1 = symbolName1.pluralize.underscore
  methodName2 = symbolName2.pluralize.underscore
       
  model1 = FactoryGirl.create(symbol1)
  
  model1.should be_valid

  #  has_many
                  
  model1.send(methodName2) << FactoryGirl.create(symbol2)
  model1.send(methodName2) << FactoryGirl.create(symbol2)
  model1.send(methodName2) << FactoryGirl.create(symbol2)
    
  model1.save.should be_true

  model1.send(methodName2).count.should === 3

  ## belong        
  model1.send(methodName2).each{|i|  i.send(methodName1).find(model1.id).id.should == model1.id }

end

=end


