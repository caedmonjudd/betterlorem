# BetterLorem
#
# A better Lorem Ipsum generator
#
# Created By Caedmon Judd
# http://statebuilt.com
#
# Copyright 2012 State Digital. All rights reserved.
#

module BetterLorem

  PUNCTUATION = ['.', ',', '!', '?', ':']

  # Return Words
  def self.w(count = 15, plainText = false, exclude_trailing_period = false)
    loader = Loader.new

    # Merge paragraphs into one line and split into words
    words = loader.lines.join(' ').split(' ')

    # Start at a random index in the array
    start_inx = rand(words.count - count)

    # Check for overrun
    raise "I don't know that many words. Try a smaller value." if (start_inx + count) > words.count

    # Select a random subset of words
    select_words = words[start_inx, count]

    # Capilalize the first word in the sentence
    select_words[0].to_s.capitalize!

    # Merge words into a string
    return_words = select_words.join(' ')

    # Correct the sentence's punctuation
    if exclude_trailing_period
      remove_puctuation(return_words)
    else
      correct_punctuation(return_words)
    end

    if plainText
      "#{return_words}"
    else
      "<p>#{return_words}</p>"
    end
  end

  # Return Paragraphs
  def self.p(count = 5, plainText = false, exclude_trailing_period = false)
    loader = Loader.new

    # Start at a random index in the array but do not overrun array
    start_inx = rand(loader.lines.count - count)

    # Check for overrun
    raise "I don't know that many words. Try a smaller value." if (start_inx + count) > loader.lines.count

    # Build paragraphs from array
    paragraphs = loader.lines[start_inx, count]

    # Build final format based on parameters
    paragraphs.map! do |line|

      remove_puctuation(line) if exclude_trailing_period
      if plainText
        line = "#{line}"
      else
        line = "<p>#{line}</p>"
      end
    end

    paragraphs.join('')
  end

  # Return Characters
  def self.c(count = 100, plainText = false, exclude_trailing_period = false)
    loader = Loader.new

    # Merge paragraphs into one line
    lines = loader.lines.join(' ')

    # Start at a random index in the array
    start_inx = rand(lines.length - count)

    # Check for overrun
    raise "I don't know that many words. Try a smaller value." if (start_inx + count) > lines.length

    # Move the starting index to the beginning of a word
    inx = 1
    lines[start_inx, 100].scan(/./).each do |char|
      if char == ' '
        start_inx += inx
        break
      end
      inx += 1
    end

    # Capitalize the sentence
    sentence = lines[start_inx, count]
    sentence[0] = sentence[0].to_s.capitalize

    if plainText
      "#{sentence}"
    else
      "<p>#{sentence}</p>"
    end
  end


  private

  # Determine if the line ends with punctuation and correct it
  def self.correct_punctuation(line)
    PUNCTUATION.each do |punct|
      if line[line.length - 1].to_s == punct
        line[line.length - 1] = "."
        return
      end
    end
    line << "."
  end

  def self.remove_puctuation(line)
    PUNCTUATION.each do |punct|
      if line[line.length - 1].to_s == punct
        line[line.length - 1] = ""
        return
      end
    end
  end


  # Lorem file loader
  class Loader

    attr_accessor :lines

    def initialize
      self.lines = []
      File.open(File.dirname(__FILE__) << '/lorem.txt').each_line do |line|
        self.lines << clean_line(line)
      end
    end

    # Remove any bad characters from the line
    def clean_line(line)
      line.gsub!(/\n/, '')
    end
  end
end