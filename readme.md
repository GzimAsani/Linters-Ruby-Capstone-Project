
# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

module Errors
    attr_accessor :tot_errors, :semicolons_error, :spacearound_operators_errors, :spacearound_arguments_errors, :camelcase_error, :identation_error, :end_error, :check, :@keywords
    
    def check_semicolons(each_line)
        each_line.each_with_index do |j, y|
            if j.end_with?("/n") ||
                j.include?("//") ||
                j.end_with?("{/n") ||
                j.end_with?("}/n") ||
                j.end_with?"/n" ||
                j.end_with?";"
            else
                @semicolons_error += 1
                tot_errors << y + 1
        end
        [tot_errors, semicolons_error]
    end




end