require 'spec_helper'

describe "/hellos/show.html.erb" do
  include HellosHelper
  before(:each) do
    assigns[:hello] = @hello = stub_model(Hello,
      :s => "value for s"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ s/)
  end
end
