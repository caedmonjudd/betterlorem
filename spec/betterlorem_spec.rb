require 'spec_helper'
require 'BetterLorem'

describe BetterLorem do

  describe ".w" do
    it "should return words only" do
      words = BetterLorem.w(20)
puts words
      words.should_not == ""
    end
  end

  describe ".p" do
    it "should return paragraphs only" do



    end
  end

  describe ".c" do
    it "should return characters only" do
    end
  end

end
