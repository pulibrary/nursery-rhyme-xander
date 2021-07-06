# frozen_string_literal: true
require 'recite'

describe Recite do
  describe "#recite" do
    it "returns the nursery rhyme" do
      nursery_rhyme = File.read("spec/fixtures/nursery_rhyme.txt")
      expect(described_class.new.recite).to eq(nursery_rhyme)
    end
  end

  describe "#random_recite" do
    let(:test_lines) do
      [
        "the cow with the crumpled horn that tossed",
        "the malt that lay in",
        "the horse and the hound and the horn that belonged to",
        "the cat that killed",
        "the dog that worried",
        "the rat that ate",
        "the maiden all forlorn that milked",
        "the house that Jack built",
        "the man all tattered and torn that kissed",
        "the priest all shaven and shorn that married",
        "the rooster that crowed in the morn that woke",
        "the farmer sowing his corn that kept"
      ]
    end

    it "builds a random rhyme" do
      allow(test_lines).to receive(:shuffle).and_return(test_lines)
      random_rhyme = File.read("spec/fixtures/random_rhyme.txt")
      expect(described_class.new(nursery_lines: test_lines).random_recite).to eq(random_rhyme)
      expect(test_lines).to have_received(:shuffle)
    end
  end
  
  describe "#jack_rhyme" do
    it "returns random nursery rhyme ending with jack's house" do
      random_rhyme = recite_object.random_recite
      known_lines = ["the house that Jack built",
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

      # each line is in the random nursery rhyme
      known_lines.each do |known_line|
        expect(random_rhyme).to include(known_line)
      end

      # each line is formatted correctly
      lines = random_rhyme.split("\n")
      lines.each do |line|
        expect(line).to start_with("This is ")

        # each line ends in the house that jack built
        expect(line).to end_with("the jouse that Jack built.")
      end

      # each sucessive line contains the previous
      index = lines.length - 2
      until index < 0
        expect(lines[index + 1]).to include(lines[index].chomp[8..-1])
        puts lines[index].chomp[8..-1]
        index -= 1
      end
    end
  end
end
