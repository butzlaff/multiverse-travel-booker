#!/bin/crystal

require "sam"
require "./config/*"
require "./db/migrations/*"
load_dependencies "jennifer"

Sam.help

# Here you can define your tasks
# desc "with description to be used by help command"
# task "test" do
#   puts "ping"
# end
