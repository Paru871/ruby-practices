#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'pathname'
require 'etc'

require_relative 'command'
require_relative 'long_format'
require_relative 'short_format'

opt = OptionParser.new
params = { long_format: false, reverse: false, dot_match: false }
opt.on('-l') { |v| params[:long_format] = v }
opt.on('-r') { |v| params[:reverse] = v }
opt.on('-a') { |v| params[:dot_match] = v }
opt.parse!(ARGV)
path = ARGV[0] || '.'
pathname = Pathname(path)
Command.new(pathname, **params).ls_print
