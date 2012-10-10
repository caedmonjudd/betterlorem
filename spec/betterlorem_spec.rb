require 'spec_helper'
require 'betterlorem'

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
      puts lines
      lines.should_not == ""
    end
  end

  describe ".c" do
    it "should return 100 characters" do
      chars = BetterLorem.c(100)
      chars.length.should == 107 # 107 with HTML tags
    end
  end

end
