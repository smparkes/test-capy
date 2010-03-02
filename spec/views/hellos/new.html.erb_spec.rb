require 'spec_helper'

describe "/hellos/new.html.erb" do
  include HellosHelper

  before(:each) do
    assigns[:hello] = stub_model(Hello,
      :new_record? => true,
      :s => "value for s"
    )
  end

  it "renders new hello form" do
    render

    response.should have_tag("form[action=?][method=post]", hellos_path) do
      with_tag("input#hello_s[name=?]", "hello[s]")
    end
  end
end
