# frozen_string_literal: true
APP_ROOT = File.dirname(__FILE__)

require_relative('lib/recite')

nursery_reader = Recite.new

puts "  Original Nursery Rhyme"
puts "=========================="
puts nursery_reader.recite
puts "\n    New Nursery Rhyme"
puts "=========================="
puts nursery_reader.random_recite
