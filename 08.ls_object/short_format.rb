# frozen_string_literal: true

class ShortFormat
  NUMBER_OF_COLUMNS = 3 # 列数を指定、3列で表示（列数変更可)
  TERMINAL_WIDTH = `tput cols`.chomp.to_i # ターミナルの横幅取得

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
