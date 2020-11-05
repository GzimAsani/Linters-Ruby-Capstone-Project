require_relative './rules'

class Runfile
  include Linter
  attr_accessor :report,
                :data,
                :linters,
                :tot_errors,
                :semicolons_error,
                :cam_err,
                :var_error,
                :last_line_error

  def initialize
    @linters = []
    @tot_errors = 0
    @semicolons_error = []
    @cam_err = []
    @var_error = []
    @last_line_error = []
    @const_error = []
  end

  def message(linted)
    check_semicolons(linted)
    @linters << "Missing semicolons on line(s) #{@semicolons_error}" if @semicolons_error.length.positive?
    check_class(linted)
    @linters << "Classes should start only with uppercase string, line(s) #{@cam_err}" if @cam_err.length.positive?
    check_let_const(linted)
    @linters << "Variable/Const should start with lowercase, line(s) #{@var_error}" if @var_error.length.positive?
    last_line_check(linted)
    @linters << @last_line_error
  end
end
