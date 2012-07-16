require 'spec_helper'

describe PaymentMethod do
  context "create" do
    it { validate_presence(:payment_method, [:name]) }
    it { validate_uniqueness(:payment_method, [:name]) }
  end
  
  context "associations" do
    it {should have_and_belong_to_many(:business_units) }
  end
end
