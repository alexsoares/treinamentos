class DailyOrdersXlsFactory

  #formats:
  @@simple_format = Spreadsheet::Format.new :color => :black, :weight => :normal, :size => 10
  @@title_format = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 14, :vertical_align => :center, :horizontal_align => :center
  @@total_format = Spreadsheet::Format.new :color => :black, :weight => :bold, :vertical_align => :center, :horizontal_align => :right
  @@price_format = Spreadsheet::Format.new :color => :black, :vertical_align => :center, :horizontal_align => :center
  @@price_title_format = Spreadsheet::Format.new :color => :black, :vertical_align => :center, :horizontal_align => :right, :weight => :bold

  @@normal_format = Spreadsheet::Format.new :weight => :normal, :size => 10
  @@normal_center_format = Spreadsheet::Format.new :weight => :normal, :size => 10, :color => :black, :horizontal_align => :center, :vertical_align => :center, :border => :thin
  @@normal_left_format = Spreadsheet::Format.new :weight => :normal, :size => 10, :color => :black, :horizontal_align => :left, :vertical_align => :center, :border => :thin, :text_wrap => true
  @@normal_right_format = Spreadsheet::Format.new :weight => :normal, :size => 10, :color => :black, :horizontal_align => :right, :vertical_align => :center, :border => :thin
  @@normal_right_format_not_border = Spreadsheet::Format.new :color => :black, :size => 10, :vertical_align => :center, :horizontal_align => :right

  @@bold_format = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 10
  @@bold_center_format = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 10, :vertical_align => :center, :horizontal_align => :center
  @@bold_center_format_wbordered = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 10, :vertical_align => :center, :horizontal_align => :center, :border => :medium
  @@bold_center_format_tbordered = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 10, :vertical_align => :center, :horizontal_align => :center, :border => :thin
  @@bold_left_format = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 10, :vertical_align => :center, :horizontal_align => :left
  @@bold_left_format_wbordered = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 10, :vertical_align => :center, :horizontal_align => :left, :border => :medium
  @@bold_left_format_tbordered = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 10, :vertical_align => :center, :horizontal_align => :left, :border => :thin
  @@bold_left_format_tbordered_nright = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 10, :vertical_align => :center, :horizontal_align => :left, :border => :thin, :right => false
  @@bold_left_format_tbordered_nleft = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 10, :vertical_align => :center, :horizontal_align => :left, :border => :thin, :left => false

  @@merged_simple_format = Spreadsheet::Format.new :align => :merge, :color => :black, :weight => :normal, :size => 10, :vertical_align => :center, :border => :thin
  @@merged_heading_format = Spreadsheet::Format.new :align => :merge, :color => :black, :weight => :bold, :size => 14
  @@merged_bold_left_format = Spreadsheet::Format.new :align => :merge, :color => :black, :weight => :bold, :size => 10, :horizontal_align => :left
  @@merged_bold_center_format = Spreadsheet::Format.new :align => :merge, :color => :black, :weight => :bold, :size => 10
  @@merged_bold_center_tbordered_format = Spreadsheet::Format.new :align => :merge, :color => :black, :weight => :bold, :size => 10, :border => :thin
  #there is a point:
  @@merged_bold_left_tbordered_format = Spreadsheet::Format.new :align => :merge, :color => :black, :weight => :bold, :size => 10, :border => :thin, :horizontal_align => :left
  @@merged_left_format = Spreadsheet::Format.new :align => :merge, :color => :black, :weight => :normal, :size => 10, :vertical_align => :center, :text_wrap => true, :border => :thin

  def initialize(name)
    @reportbook = Spreadsheet::Workbook.new
    @sheet = @reportbook.create_worksheet(:name => name)
    self
  end
  def get_last_row_index
    @sheet.rows.count - 1
  end
  def get_document_height
    @sheet.rows.count
  end
  def set_row_height(row, height)
    @sheet.row(row).height = height
    self
  end
  def add_column(width)
    column_index = @sheet.columns.count
    @sheet.column(column_index).width = width
    @sheet.column(column_index).default_format = @@price_format
    self
  end
  def add_row(values, row_height = nil)
    write_row_values(@sheet.rows.count, values)
    @sheet.row(@sheet.rows.count-1).height = row_height unless row_height.nil?
    self
  end
  def set_row_height(row, height)
    @sheet.row(row).height = height
    self
  end
  def write_row_values(row, values)
    values.each_with_index { |value, i|
      write(row, i, value)
    }
    self
  end
  def write(row, column, text, height = nil)
    @sheet.row(row).set_format(column, @current_format) unless @current_format.nil?
    @sheet[row, column] = text
    @sheet.row(row).height = height unless height.nil?
    self
  end

  # Format Cursor Setters:
  #
  def set_title_format; @current_format = @@title_format; self; end
  def set_bold_format; @current_format = @@bold_format; self; end
  def set_price_format; @current_format = @@price_format; self; end
  def set_total_format; @current_format = @@total_format; self; end
  def set_price_title_format; @current_format = @@price_title_format; self; end
  def set_normal_left_format; @current_format = @@normal_left_format; self; end
  def set_normal_center_format; @current_format = @@normal_center_format; self; end
  def set_bold_center_format; @current_format = @@bold_center_format; self; end
  def set_bold_left_format; @current_format = @@bold_left_format; self; end
  def set_bold_left_format_tbordered; @current_format = @@bold_left_format_tbordered; self; end
  def set_bold_left_format_wbordered; @current_format = @@bold_left_format_wbordered; self; end
  def set_bold_center_format_tbordered;@current_format = @@bold_center_format_tbordered;self; end
  def set_bold_center_format_wbordered;@current_format = @@bold_center_format_wbordered;self; end

  # Apply formats to cells
  #
  def apply_normal_right_format_not_border(row, column)
    @sheet.row(row).set_format(column, @@normal_right_format_not_border); self
  end
  def apply_normal_right_format(row, column)
    @sheet.row(row).set_format(column, @@normal_right_format); self
  end
  def apply_normal_left_format(row, column)
    @sheet.row(row).set_format(column, @@normal_left_format); self
  end
  def apply_bold_left_format_tbordered_nright(row, column)
    @sheet.row(row).set_format(column, @@bold_left_format_tbordered_nright); self
  end
  def apply_bold_left_format_tbordered_nleft(row, column)
    @sheet.row(row).set_format(column, @@bold_left_format_tbordered_nleft); self
  end
  def apply_bold_center_format_wbordered(row, column)
    @sheet.row(row).set_format(column, @@bold_center_format_wbordered); self
  end
  def apply_bold_center_format_tbordered(row, column)
    @sheet.row(row).set_format(column, @@bold_center_format_tbordered); self
  end
  def apply_normal_center_format(row, column)
    @sheet.row(row).set_format(column, @@normal_center_format); self
  end
  def apply_bold_center_format(row, column)
    @sheet.row(row).set_format(column, @@bold_center_format); self
  end
  def apply_title_format(row, column)
    @sheet.row(row).set_format(column, @@title_format); self
  end

  #Cells Merging:
  #
  def apply_range_format_for_last_row(range, format)
    joined_row = @sheet.row(get_last_row_index)
    range.each do |i|
      joined_row.set_format(i, format)
    end
    self
  end
  def join_last_row_heading(range)
    apply_range_format_for_last_row range, @@merged_heading_format
  end
  def join_last_row_bold_left(range)
    apply_range_format_for_last_row range, @@merged_bold_left_format
  end
  def join_last_row_bold_center(range)
    apply_range_format_for_last_row range, @@merged_bold_center_format
  end
  def join_last_row_bold_center_tbordered(range)
    apply_range_format_for_last_row range, @@merged_bold_center_tbordered_format
  end
  def join_last_row_simple(range)
    apply_range_format_for_last_row range, @@merged_left_format
  end

  #NOT WORKED!>>
  def join_last_row_bold_left_tbordered(range)
    apply_range_format_for_last_row range, @@merged_bold_left_tbordered_format
  end

  #Post functions
  #
  def save_to_file fname
    f = File.new(fname, "w+")
    @reportbook.write(f.path)
    f.close
    f.path
  end
  def get_report
    @reportbook
  end
  def get_sheet
    @sheet
  end
end