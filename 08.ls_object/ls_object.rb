#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'pathname'
require 'etc'

require_relative 'command'
require_relative 'long_format'
require_relative 'short_format'

NUMBER_OF_COLUMNS = 3 # 列数を指定、3列で表示（列数変更可)
TERMINAL_WIDTH = `tput cols`.chomp.to_i # ターミナルの横幅取得

# p path = ARGV[0] || '.'
# p pathname = Pathname(path)
# p options = ARGV.getopts('a', 'r', 'l')
# Command.new(pathname, options).ls_print


opt = OptionParser.new
params = { long_format: false, reverse: false, dot_match: false }
opt.on('-l') { |v| params[:long_format] = v }
opt.on('-r') { |v| params[:reverse] = v }
opt.on('-a') { |v| params[:dot_match] = v }
opt.parse!(ARGV)
path = ARGV[0] || '.'
pathname = Pathname(path)
Command.new(pathname, **params).ls_print
