#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'etc'

require_relative 'print'
require_relative 'option_l'

NUMBER_OF_COLUMNS = 3 # 列数を指定、3列で表示（列数変更可)

options = ARGV.getopts('a', 'r', 'l')
Print.new(options).ls_print
