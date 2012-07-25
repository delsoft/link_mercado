require 'spec_helper'

describe "business_units/edit" do
  before(:each) do
    @business_unit = assign(:business_unit, stub_model(BusinessUnit))
  end

  it "renders the edit business_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_units_path(@business_unit), :method => "post" do
    end
  end
end
