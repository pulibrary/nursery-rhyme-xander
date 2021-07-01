# frozen_string_literal: true
class Recite
  def recite
    File.read("lib/assets/nursery_rhyme.txt")
  end
end
