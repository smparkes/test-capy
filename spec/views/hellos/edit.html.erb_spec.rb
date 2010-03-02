require 'spec_helper'

describe "/hellos/edit.html.erb" do
  include HellosHelper

  before(:each) do
    assigns[:hello] = @hello = stub_model(Hello,
      :new_record? => false,
      :s => "value for s"
    )
  end

  it "renders the edit hello form" do
    render

    response.should have_tag("form[action=#{hello_path(@hello)}][method=post]") do
      with_tag('input#hello_s[name=?]', "hello[s]")
    end
  end
end
