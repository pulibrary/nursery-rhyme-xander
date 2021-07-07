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
end
