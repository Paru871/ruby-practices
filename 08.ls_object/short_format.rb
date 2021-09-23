#!/usr/bin/env ruby
# frozen_string_literal: true

class ShortFormat
  def initialize(files)
    @files = files
    @basename = files.map { |file| File.basename(file) }
  end

  def print_column
    row_width = TERMINAL_WIDTH / NUMBER_OF_COLUMNS
    number_of_rows = (@files.length / NUMBER_OF_COLUMNS.to_f).ceil

    number_of_rows.times do |count|
      NUMBER_OF_COLUMNS.times do |idx|
        if @files[count + idx * number_of_rows].nil?
          print ''
        else
          print @basename[count + idx * number_of_rows].ljust(row_width)
        end
      end
      print "\n"
    end
  end
end
