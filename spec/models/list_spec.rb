require "spec_helper"

describe List do
  context "validations" do
    subject { List.create.errors }
    its([:name]) { should_not be_empty }

    it "accepts attributes" do
      subject = List.new(:name => "Some list")
      subject.should be_valid
    end
  end
end
