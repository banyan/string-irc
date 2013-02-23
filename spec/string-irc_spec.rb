# coding: utf-8
require 'spec_helper'

describe StringIrc do
  subject { StringIrc.new('hello') }

  describe '#to_s' do
    context 'when only foreground color passed in' do
      StringIrc::COLOR_TABLE.each do |color, codes|
        codes.each do |code|
          context "foreground color: #{code}" do
            it { expect(subject.send(code).to_s).to eq("\x03#{ "%02d" % color }hello\x0f") }
          end
        end
      end
    end

    context 'when foreground color and background color are passed in' do
      StringIrc::COLOR_TABLE.each do |color, codes|
        codes.each do |code|
          context "foreground color and background color: #{code}" do
            it { expect(subject.send(code, code).to_s).to eq("\x03#{ "%02d" % color },#{ "%02d" % color }hello\x0f") }
          end
        end
      end
    end

    context 'when colors are not passed in' do
      it { expect(subject.to_s).to eq("hello\x0f") }
    end
  end

  context "when decorating method passed in" do
    describe '#bold' do
      it { expect(subject.bold.to_s).to eq("\x02hello\x0f") }
    end

    describe '#underline' do
      it { expect(subject.underline.to_s).to eq("\x1fhello\x0f") }
    end

    describe '#inverse' do
      it { expect(subject.inverse.to_s).to eq("\x16hello\x0f") }
    end
  end

  context "when original color scheme method passed in" do
    describe '#rainbow' do
      it { expect(subject.rainbow.to_s).to eq("\u000304h\u000307e\u000308l\u000303l\u000302o\u000F") }
      it { expect(subject.rainbow("black").to_s).to eq("\u000304,01h\u000307,01e\u000308,01l\u000303,01l\u000302,01o\u000F") }
    end

    describe '#seven_eleven' do
      it { expect(subject.seven_eleven.to_s).to eq("\u000307h\u000303e\u000304l\u000307l\u000303o\u000F") }
      it { expect(subject.seven_eleven("black").to_s).to eq("\u000307,01h\u000303,01e\u000304,01l\u000307,01l\u000303,01o\u000F") }
    end
  end
end
