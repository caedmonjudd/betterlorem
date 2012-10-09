# BetterLorem
#-----------------------------------------------------------
# State Digital -- Caedmon Judd -- caedmon@statebuilt.com
# http://statebuilt.com
#-----------------------------------------------------------
#

module BetterLorem

  # Return Words
  def self.w(count)
    loader = Loader.new

    # Merge paragraphs into one line and split into words
    words = loader.lines.join(' ').split(' ')

    # Start at a random index in the array
    start_inx = rand(words.count)

    select_words = words[start_inx, count]
    select_words[0].to_s.capitalize!

    return_words = select_words.join(' ')

    return_words << "." unless loader.is_end_with_puncuation?(return_words)
    return_words
  end

  # Return Paragraphs
  def self.p(count)
    loader = Loader.new

  end

  # Return Characters
  def self.c(count)
    loader = Loader.new

  end

  private

  class Loader

    attr_accessor :lines

    PUNCTUATION = ['.', ',', '!', '?', ':']

    def initialize
      self.lines = []
      File.open('lorem.txt').each_line do |line|
        self.lines << clean_line(line)
      end
    end

    def clean_line(line)
      line.gsub!(/\n/, '')
    end

    def capilalize_sentences(line)
      line.split.each { |x| print x.capitalize!, " "}.join(" ")
    end

    def is_end_with_puncuation?(line)
      PUNCTUATION.each do |punct|
        puts "Test = #{line[line.length - 1].to_s}"
        if line[line.length - 1].to_s == punct
          line[line.length - 1] = "."
          return true
        end
      end
      false
    end

  end

end