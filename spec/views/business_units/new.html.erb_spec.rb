require 'spec_helper'

describe "business_units/new" do
  before(:each) do
    assign(:business_unit, stub_model(BusinessUnit).as_new_record)
  end

  it "renders new business_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_units_path, :method => "post" do
    end
  end
end
