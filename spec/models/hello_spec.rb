require 'spec_helper'

describe Hello do
  before(:each) do
    @valid_attributes = {
      :s => "value for s"
    }
  end

  it "should create a new instance given valid attributes" do
    Hello.create!(@valid_attributes)
  end
end
