require 'spec_helper'
require 'BetterLorem'

describe BetterLorem do

  describe ".w" do
    it "should return words only" do
      words = BetterLorem.w(20)
      words.should_not == ""
    end
  end

  describe ".p" do
    it "should return paragraphs only" do
      lines = BetterLorem.p(3)
      lines.should_not == ""
    end
  end

  describe ".c" do
    it "should return characters only" do
      chars = BetterLorem.c(100)
      puts chars
      chars.should_not == ""
    end
  end

end
