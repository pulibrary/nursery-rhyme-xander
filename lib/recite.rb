# frozen_string_literal: true
class Recite
  attr_reader :nursery_lines

  # @param nursery_lines [Array<String>] phrases in the nursery rhyme
  def initialize(nursery_lines: default_lines)
    @nursery_lines = nursery_lines
  end

  # Builds nursery rhyme from the phrases
  # @return [String]
  def recite
    build_rhyme(nursery_lines)
  end

  # Builds a random nursery rhyme from the phrases
  # @return [String]
  def random_recite
    # shuffled array of phrases in the nursery rhyme
    shuffled = nursery_lines.shuffle
    build_rhyme(shuffled)
  end

  # Builds a random nursery rhyme; each line ends in the first phrase
  # @return [String]
  def semi_random_recite
    last_phrase = nursery_lines[0]
    shuffled = nursery_lines.shuffle.reject { |phrase| phrase == last_phrase }
    build_rhyme(shuffled.unshift(last_phrase))
  end

  private

  # helper returns array of nursery rhyme lines
  def default_lines
    ["the house that Jack built",
     "the malt that lay in",
     "the rat that ate",
     "the cat that killed",
     "the dog that worried",
     "the cow with the crumpled horn that tossed",
     "the maiden all forlorn that milked",
     "the man all tattered and torn that kissed",
     "the priest all shaven and shorn that married",
     "the rooster that crowed in the morn that woke",
     "the farmer sowing his corn that kept",
     "the horse and the hound and the horn that belonged to"]
  end

  # Creates nursery rhyme from independent lines
  # @param lines [Array<String>] list of phrases
  # @return [String]
  def build_rhyme(lines)
    reverse_lines = lines.reverse
    lines.each_index.map do |index|
      # construct one line
      phrase = reverse_lines[(lines.length - index - 1)..-1].join(" ")
      "This is #{phrase}."
    end.join("\n")
  end
end
