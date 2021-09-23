#!/usr/bin/env ruby
# frozen_string_literal: true

class Command
  def initialize(pathname, options)
    @pathname = pathname
    @options = options
  end

  def ls_print
    pattern = @pathname.join('*')
    params = @options['a'] ? [pattern, File::FNM_DOTMATCH] : [pattern]
    files = Dir.glob(*params).sort
    files.reverse! if @options['r']
    @options['l'] ? LongFormat.new(files).print_list : ShortFormat.new(files).print_column
  end
end
