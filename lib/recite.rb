# frozen_string_literal: true
class Recite
  def recite
    lines = File.read("lib/assets/nursery_lines.txt").split("\n")
    build_rhyme(lines)
  end

  def random_recite
    # shuffled array of phrases in the nursery rhyme
    shuffled = File.read("lib/assets/nursery_lines.txt").split("\n").shuffle

    # construct random nursery rhyme
    build_rhyme(shuffled)
  end

  # helper to create a nursery rhyme from independent lines
  def build_rhyme(lines)
    rhyme = ""
    lines.length.times do |index|
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
