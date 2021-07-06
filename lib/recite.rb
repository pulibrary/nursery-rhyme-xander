# frozen_string_literal: true
class Recite
  def recite
    build_rhyme(nursery_lines)
  end

  def random_recite
    # shuffled array of phrases in the nursery rhyme
    shuffled = nursery_lines.shuffle
    build_rhyme(shuffled)
  end

  # helper returns array of nursery rhyme lines
  def nursery_lines
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
    rhyme = ""
    lines.each_index do |index|
      # construct one line
      line = "This is "
      pointer = index
      until pointer.negative?
        line += lines[pointer] + " "
        pointer -= 1
      end
      rhyme += line.chomp(" ") + ".\n"
    end

    rhyme.chomp("\n")
  end
end
