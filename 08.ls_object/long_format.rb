# frozen_string_literal: true

class LongFormat
  MODE_TABLE = {
    '0' => '---',
    '1' => '-x-',
    '2' => '-w-',
    '3' => '-wx',
    '4' => 'r--',
    '5' => 'r-x',
    '6' => 'rw-',
    '7' => 'rwx'
  }.freeze

  def initialize(files)
    @files = files
  end

  def print_list
    row_data = @files.map do |file|
      { stats: File::Stat.new(file), file: file, filename: File.basename(file) }
    end

    total_blocks = row_data.sum { |hash| hash[:stats].blocks }
    puts "total #{total_blocks}"

    row_data.each do |data|
      output = [
        make_permission(data[:stats]),
        data[:stats].nlink.to_s.rjust(4),
        Etc.getpwuid(data[:stats].uid).name,
        Etc.getgrgid(data[:stats].gid).name,
        data[:stats].size.to_s.rjust(7),
        data[:stats].mtime.strftime('%_m %e %R'),
        data[:filename]
      ]
      puts output.join('  ')
    end
  end

  private

  def make_permission(stat)
    case stat.ftype
    when 'directory' then file_type = 'd'
    when 'file' then file_type = '-'
    when 'link' then file_type = 'l'
    end

    p1 = MODE_TABLE[stat.mode.to_s(8)[-3, 1]]
    p2 = MODE_TABLE[stat.mode.to_s(8)[-2, 1]]
    p3 = MODE_TABLE[stat.mode.to_s(8)[-1, 1]]
    file_type + p1 + p2 + p3
  end
end
