# frozen_string_literal: true
class Recite
    def recite
        return File.read("lib/assets/nursery_rhyme.txt")
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
            until pointer < 0
                line << shuffled[pointer] + " "
                pointer -= 1
            end
            lines << line.chomp(" ") + ".\n"
            
        end

        return lines
    end
end
