# frozen_string_literal: true
APP_ROOT = File.dirname(__FILE__)

require_relative('lib/recite')

nursery_reader = Recite.new
puts nursery_reader.recite
