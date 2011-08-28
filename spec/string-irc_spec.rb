# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe StringIrc do
  share_examples_for 'when it first created' do
    specify { should be_an_instance_of StringIrc }
  end

  context 'with an argument "hello"' do
    subject { StringIrc.new('hello') }

    it_should_behave_like 'when it first created' do
      its(:to_s) { should == "hello\u000F" }
    end

    context "single color" do
      its("red.to_s")          { should == "\u000304hello\u000F" }
      its("blue.to_s")         { should == "\u000302hello\u000F" }
      its("blue_cyan.to_s")    { should == "\u000310hello\u000F" }
      its("light_purple.to_s") { should == "\u000313hello\u000F" }
    end

    context "decoration" do
      its("bold.to_s")      { should == "\u0002hello\u000F" }
      its("underline.to_s") { should == "\u001Fhello\u000F" }
      its("inverse.to_s")   { should == "\u0016hello\u000F" }
    end

    context "complex" do
      its("bold.yellow.to_s")                   { should == "\u000308\u0002hello\u000F" }
      its("bold.yellow.underline.to_s")         { should == "\u001F\u000308\u0002hello\u000F" }
      its("bold.yellow.underline.inverse.to_s") { should == "\u0016\u001F\u000308\u0002hello\u000F" }
    end

    context "complex" do
      its("bold.yellow.to_s")                   { should == "\u000308\u0002hello\u000F" }
      its("bold.yellow.underline.to_s")         { should == "\u001F\u000308\u0002hello\u000F" }
      its("bold.yellow.underline.inverse.to_s") { should == "\u0016\u001F\u000308\u0002hello\u000F" }
    end

    context "bg-color" do
      describe 'yellow("red").to_s' do
        it { subject.yellow("red").to_s.should == "\u000308,04hello\u000F" }
      end
      describe 'red("yellow").to_s' do
        it { subject.red("yellow").to_s.should == "\u000304,08hello\u000F" }
      end
      describe 'red("cyan").to_s' do
        it { subject.red("cyan").to_s.should == "\u000304,11hello\u000F" }
      end
    end
  end

  context "without an argument" do
    subject { StringIrc.new }

    it_should_behave_like "when it first created" do
      its(:to_s) { should == "\u000F" }
    end

    context "single color" do
      its("red.to_s") { should == "\u000304\u000F" }
    end

    context "decoration" do
      its("bold.to_s")      { should == "\u0002\u000F" }
      its("underline.to_s") { should == "\u001F\u000F" }
      its("inverse.to_s")   { should == "\u0016\u000F" }
    end

    context "complex" do
      its("bold.yellow.to_s")                   { should == "\u000308\u0002\u000F" }
      its("bold.yellow.underline.to_s")         { should == "\u001F\u000308\u0002\u000F" }
      its("bold.yellow.underline.inverse.to_s") { should == "\u0016\u001F\u000308\u0002\u000F" }
    end
  end
end
