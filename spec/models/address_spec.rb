# encoding: utf-8
require 'spec_helper'

describe Address do
  
  context "create" do
    pending "deveria endereço (logradouro) ser unico para cada cidade??  confirmar isso"
    
    it {validate_presence(:address, [:state_id, :city_id, :district_id])}
      
  end
  
  context "associations" do
    it { should belong_to(:state) }
    it { should belong_to(:city) }
    it { should belong_to(:district) }
    it { should have_and_belong_to_many(:business_units) }

  end
  
end
