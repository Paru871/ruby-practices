# frozen_string_literal: true

class Command
  def initialize(pathname, params)
    @pathname = pathname
    @params = params
  end

  def ls_print
    pattern = @pathname.join('*')
    params = @params[:dot_match] ? [pattern, File::FNM_DOTMATCH] : [pattern]
    files = Dir.glob(*params).sort
    files.reverse! if @params[:reverse]
    @params[:long_format] ? LongFormat.new(files).print_list : ShortFormat.new(files).print_column
  end
end
