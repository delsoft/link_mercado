require 'spec_helper'

describe "business_units/index" do
  before(:each) do
    assign(:business_units, [
      stub_model(BusinessUnit),
      stub_model(BusinessUnit)
    ])
  end

  it "renders a list of business_units" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
