require 'spec_helper'

describe "/hellos/index.html.erb" do
  include HellosHelper

  before(:each) do
    assigns[:hellos] = [
      stub_model(Hello,
        :s => "value for s"
      ),
      stub_model(Hello,
        :s => "value for s"
      )
    ]
  end

  it "renders a list of hellos" do
    render
    response.should have_tag("tr>td", "value for s".to_s, 2)
  end
end
