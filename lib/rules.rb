# frozen_string_literal: true

# rubocop:disable Style/Documentation
module Linter
  attr_accessor :current_file,
                :data,
                :report_mistake,
                :reader, :file_tag,
                :file_row,
                :tot_errors,
                :semicolons_error,
                :spacearound_operators_errors,
                :spacearound_arguments_errors,
                :camelcase_error,
                :trailing_error

  def if_empty?
    reader.split(' ').empy?
  end

  def check_semicolons(each_line)
    each_line.each_with_index do |j, y|
      if j.end_with?(";\n") || j.include?('//') || j.end_with?("{\n") || j.end_with?("}\n") || j == "\n"
      else
        @tot_errors += 1
        @semicolons_error << y + 1
      end
    end
    [tot_errors, semicolons_error]
  end
end
# rubocop:enable Style/Documentation
