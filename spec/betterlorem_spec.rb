require 'spec_helper'
require 'BetterLorem'

describe BetterLorem do

  # Crappy specs start here
  describe ".w" do
    it "should return 20 words" do
      words = BetterLorem.w(20)
      words.should_not == ""
    end
  end

  describe ".p" do
    it "should return 3 paragraphs" do
      lines = BetterLorem.p(3)
      lines.should_not == ""
    end
  end

  describe ".c" do
    it "should return 100 characters" do
      chars = BetterLorem.c(100)
      chars.length.should == 100
    end
  end

end
