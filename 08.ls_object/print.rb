#!/usr/bin/env ruby
# frozen_string_literal: true

class Print
  def initialize(options)
    @options = options
  end

  def ls_print
    files = @options['a'] ? Dir.glob(['*', '.*']).sort : Dir.glob('*').sort
  
    files.reverse! if @options['r']

    @options['l'] ? OptionL.new(files).print_list(files) : OptionL.new(files).print_column(files)
  end
end
