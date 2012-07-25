require 'spec_helper'

describe "business_units/show" do
  before(:each) do
    @business_unit = assign(:business_unit, stub_model(BusinessUnit))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
