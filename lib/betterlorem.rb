# BetterLorem
#-----------------------------------------------------------
# State Digital -- Caedmon Judd -- caedmon@statebuilt.com
# http://statebuilt.com
#-----------------------------------------------------------
#

module BetterLorem

  PUNCTUATION = ['.', ',', '!', '?', ':']

  # Return Words
  def self.w(count, line_ending = "<br>", surround_with_tag = "p")
    loader = Loader.new

    # Merge paragraphs into one line and split into words
    words = loader.lines.join(' ').split(' ')

    # Start at a random index in the array
    start_inx = rand(words.count)

    # Select a random subset of words
    select_words = words[start_inx, count]

    # Capilalize the first word in the sentence
    select_words[0].to_s.capitalize!

    # Merge words into a string
    return_words = select_words.join(' ')

    # Correct the sentence's punctuation
    correct_punctuation(return_words)

    return_words = "<#{surround_with_tag}>#{return_words}</#{surround_with_tag}>#{line_ending}"
  end

  # Return Paragraphs
  def self.p(count, line_ending = "<br>", surround_with_tag = "p")
    loader = Loader.new
    start_inx = 1

    # Start at a random index in the array but do not overrun array
    start_inx = rand(loader.lines.count - count)

    # Build paragraphs from array
    paragraphs = loader.lines[start_inx, count]

    # Build final format based on parameters
    paragraphs.map! do |line|
      line = "<#{surround_with_tag}>#{line}</#{surround_with_tag}>#{line_ending}"
    end

    paragraphs.join('\n')
  end

  # Return Characters
  def self.c(count, line_ending = "<br>", surround_with_tag = "p")
    loader = Loader.new

    # Start at a random index in the array


    lines = loader.lines.join(' ')

    start_inx = rand(lines.length)

    chars = lines[start_inx, count]



  end


  private

  # Determine if the line ends with punctuation
  def self.correct_punctuation(line)
    PUNCTUATION.each do |punct|
      if line[line.length - 1].to_s == punct
        line[line.length - 1] = "."
        return
      end
    end
    line << "."
  end


  class Loader

    attr_accessor :lines

    def initialize
      self.lines = []
      File.open('lorem.txt').each_line do |line|
        self.lines << clean_line(line)
      end
    end

    # Remove any bad characters from the line
    def clean_line(line)
      line.gsub!(/\n/, '')
    end

    # Capitalize the sentence that is passed
    def capilalize_sentences(line)
      line.split.each { |x| print x.capitalize!, " " }.join(" ")
    end


  end

end