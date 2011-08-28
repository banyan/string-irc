# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe StringIrc do
  share_examples_for 'when it first created' do
    specify { should be_an_instance_of StringIrc }
  end

  context 'with an argument "hello"' do
    subject { StringIrc.new('hello') }

    it_should_behave_like 'when it first created' do
      its(:to_s) { should == "hello\x0f" }
    end

    context "single color" do
      its("red.to_s")          { should == "\x0304hello\x0f" }
      its("blue.to_s")         { should == "\x0302hello\x0f" }
      its("blue_cyan.to_s")    { should == "\x0310hello\x0f" }
      its("light_purple.to_s") { should == "\x0313hello\x0f" }
    end

    context "decoration" do
      its("bold.to_s")      { should == "\x02hello\x0f" }
      its("underline.to_s") { should == "\x1fhello\x0f" }
      its("inverse.to_s")   { should == "\x16hello\x0f" }
    end

    context "complex" do
      its("bold.yellow.to_s")                   { should == "\x0308\x02hello\x0f" }
      its("bold.yellow.underline.to_s")         { should == "\x1f\x0308\x02hello\x0f" }
      its("bold.yellow.underline.inverse.to_s") { should == "\x16\x1f\x0308\x02hello\x0f" }
    end

    context "complex" do
      its("bold.yellow.to_s")                   { should == "\x0308\x02hello\x0f" }
      its("bold.yellow.underline.to_s")         { should == "\x1f\x0308\x02hello\x0f" }
      its("bold.yellow.underline.inverse.to_s") { should == "\x16\x1f\x0308\x02hello\x0f" }
    end

    context "bg-color" do
      describe 'yellow("red").to_s' do
        it { subject.yellow("red").to_s.should == "\x0308,04hello\x0f" }
      end
      describe 'red("yellow").to_s' do
        it { subject.red("yellow").to_s.should == "\x0304,08hello\x0f" }
      end
      describe 'red("cyan").to_s' do
        it { subject.red("cyan").to_s.should == "\x0304,11hello\x0f" }
      end
    end
  end

  context "without an argument" do
    subject { StringIrc.new }

    it_should_behave_like "when it first created" do
      its(:to_s) { should == "\x0f" }
    end

    context "single color" do
      its("red.to_s") { should == "\x0304\x0f" }
    end

    context "decoration" do
      its("bold.to_s")      { should == "\x02\x0f" }
      its("underline.to_s") { should == "\x1f\x0f" }
      its("inverse.to_s")   { should == "\x16\x0f" }
    end

    context "complex" do
      its("bold.yellow.to_s")                   { should == "\x0308\x02\x0f" }
      its("bold.yellow.underline.to_s")         { should == "\x1f\x0308\x02\x0f" }
      its("bold.yellow.underline.inverse.to_s") { should == "\x16\x1f\x0308\x02\x0f" }
    end
  end
end
