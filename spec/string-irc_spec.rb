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
      it { expect(subject.rainbow.to_s).to eq("\x0304h\x0307e\x0308l\x0303l\x0302o\x0f") }
      it { expect(subject.rainbow("black").to_s).to eq("\x0304,01h\x0307,01e\x0308,01l\x0303,01l\x0302,01o\x0f") }
    end

    describe '#seven_eleven' do
      it { expect(subject.seven_eleven.to_s).to eq("\x0307h\x0303e\x0304l\x0307l\x0303o\x0f") }
      it { expect(subject.seven_eleven("black").to_s).to eq("\x0307,01h\x0303,01e\x0304,01l\x0307,01l\x0303,01o\x0f") }
    end
  end
end
