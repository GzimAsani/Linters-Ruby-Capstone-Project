# frozen_string_literal: true

require_relative './rules'

class RunFile
  include Linter
  attr_accessor :report,
                :current_file,
                :data,
                :report_mistake,
                :reader, :file_tag,
                :file_row,
                :tot_errors,
                :semicolons_error,
                :trailing_error

  def initialize
    @report_mistake = []
    @trailing_error = []
    @tot_errors = 0
    @semicolons_error = []
  end

  def message(linted)
    check_semicolons(linted)
    @report_mistake << "Missing semicolons on line(s) #{@semicolons_error}" if @semicolons_error.length.positive?
    @report_mistake << "Trailing space on line(s) #{@trailing_error}" if @trailing_error.length.positive?
  end
end
