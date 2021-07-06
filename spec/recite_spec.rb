# frozen_string_literal: true
require 'recite'

describe Recite do
  subject(:recite_object) { described_class.new }
  let(:random_lines) { [
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
  ] }

  describe "#recite" do
    it "returns the nursery rhyme" do
      nursery_rhyme = File.read("spec/fixtures/nursery_rhyme.txt")
      expect(recite_object.recite).to eq(nursery_rhyme)
    end
  end

  describe "#random_recite" do
    before do
      double = instance_double(Array)
      allow(Array).to receive(:new).and_return(double)
      allow(double).to receive(:shuffle).and_return(random_lines)
    end
    it "builds a random rhyme" do
      random_rhyme = File.read("spec/fixtures/random_rhyme.txt")
      expect(recite_object.random_recite).to eq(random_rhyme)
    end
  end

  # describe "#build_rhyme" do
  #   it "builds a nursery rhyme from the lines" do
  #     random_rhyme = File.read("spec/fixtures/random_rhyme.txt")
  #     expect(recite_object.build_rhyme(random_lines)).to eq(random_rhyme)
  #   end
  # end
end
