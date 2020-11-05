
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
            if j.end_with?(";\n") ||
                j.include?("//") ||
                j.end_with?("{\n") ||
                j.end_with?("}\n") ||
                j == "\n" ||
                j.end_with?(";")
                j.end_with?("; ")
                j.end_with?("; +1")
            else
                @tot_errors += 1
                @semicolons_error << y + 1
                
            end
        end
        [tot_errors, semicolons_error]
    end

    def check_trailing_space
        data.each_with_index do |row, y|
            line = data.find_index(row) + 1
            if row.split('')[-1] == ' '
                trailing_error += 1
                tot_errors << y + 1
            end
        end
    end    
end