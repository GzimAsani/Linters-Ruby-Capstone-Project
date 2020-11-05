module Linter
  attr_accessor :current_file,
                :data,
                :report_mistake,
                :tot_errors,
                :semicolons_error,
                :var_error,
                :spacearound_arguments_errors,
                :cam_err,
                :last_line_error

  def check_semicolons(each_line)
    each_line.each_with_index do |j, y|
      next if j.end_with?(";\n") || j.end_with?("{\n") || j.end_with?("}\n") || j == "\n" || j.end_with?(';')

      @tot_errors += 1
      @semicolons_error << y + 1
    end
    [tot_errors, semicolons_error]
  end

  def check_class(rows)
    rows.each_with_index do |x, i|
      case x
      when /class/
        unless (x[(x.index('class') + 6)] =~ /[a-z0-9(){}]/).nil?
          @cam_err << i + 1
          @tot_errors += 1
        end
      end
    end
    [tot_errors, cam_err]
  end

  def check_let_const(rows)
    rows.each_with_index do |x, i|
      case x
      when /const/
        unless (x[(x.index('const') + 6)] =~ /[0-9A-Z]/).nil?
          @var_error << i + 1
          @tot_errors += 1
        end
      when /let/
        unless (x[(x.index('let') + 4)] =~ /[0-9A-Z]/).nil?
          @var_error << i + 1
          @tot_errors += 1
        end
      end
    end
    [@tot_errors, @var_error]
  end

  def last_line_check(rows)
    last_row = rows.size
    unless rows.size.positive? && rows[-1].include?("\n")
      @last_line_error << "Expecting blank line after end [#{last_row}]"
    end
    return unless rows.size.positive? && rows[-1] == "\n"

    x = -1
    return @last_line_error << "Unexpected blank line after [#{last_row + 1}]" if rows[x] == "\n"
  end
end
