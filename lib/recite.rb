# frozen_string_literal: true
class Recite
  def recite
    File.read("lib/assets/nursery_rhyme.txt")
  end

  def random_recite
    # shuffled array of phrases in the nursery rhyme
    shuffled = File.read("lib/assets/nursery_lines.txt").split("\n").shuffle

    # construct random nursery rhyme
    lines = ""
    shuffled.length.times do |index|
      # construct one line
      line = "This is "
      pointer = index
      until pointer.negative?
        line += shuffled[pointer] + " "
        pointer -= 1
      end
      lines += line.chomp(" ") + ".\n"
    end

    lines
  end
end
