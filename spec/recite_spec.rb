# frozen_string_literal: true
require 'recite'

describe Recite do
  subject(:recite_object) { described_class.new }
  let(:known_lines) do
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

  describe "#recite" do
    it "returns the nursery rhyme" do
      expect(recite_object.recite).to eq("This is the house that Jack built.\n"\
      "This is the malt that lay in the house that Jack built.\n"\
      "This is the rat that ate the malt that lay in the house that Jack built.\n"\
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"\
      "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"\
      "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"\
      "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"\
      "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"\
      "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"\
      "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"\
      "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"\
      "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.")
    end
  end

  describe "#random_recite" do
    it "includes all phrases/lines" do
      random_rhyme = recite_object.random_recite
      known_lines.each do |known_line|
        expect(random_rhyme).to include(known_line)
      end
    end

    it "has formatted lines" do
      random_rhyme = recite_object.random_recite
      lines = random_rhyme.split("\n")
      lines.each do |line|
        expect(line).to start_with("This is ")
        expect(line).to end_with(".")
      end
    end

    it "has each line contained in the next" do
      random_rhyme = recite_object.random_recite
      lines = random_rhyme.split("\n")
      index = lines.length - 2
      until index < 0
        expect(lines[index + 1]).to include(lines[index].chomp[8..-1])
        index -= 1
      end
    end
  end
end
