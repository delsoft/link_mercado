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
    should validate_uniqueness_of(k.to_sym)
  }
   
  not_pres_attr.each{ |k|
    should_not validate_uniqueness_of(k.to_sym)
  }
   
end

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


