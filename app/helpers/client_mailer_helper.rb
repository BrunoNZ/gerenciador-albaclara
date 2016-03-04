module ClientMailerHelper
  def table_line_number
    @number = @number.nil? ? 1 : @number + 1
  end
end
