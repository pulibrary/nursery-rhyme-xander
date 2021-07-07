# frozen_string_literal: true
require 'pry-byebug'
class Recite
  attr_reader :nursery_lines
  def initialize(nursery_lines: default_lines)
    @nursery_lines = nursery_lines
  end

  def recite
    build_rhyme(nursery_lines)
  end

  def random_recite
    # shuffled array of phrases in the nursery rhyme
    shuffled = nursery_lines.shuffle
    build_rhyme(shuffled)
  end

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

  # helper to create a nursery rhyme from independent lines
  def build_rhyme(lines)
    reverse_lines = lines.reverse
    lines.each_index.map do |index|
      # construct one line
      phrase = reverse_lines[(lines.length - index - 1)..-1].join(" ")
      "This is #{phrase}."
    end.join("\n")
  end
end
