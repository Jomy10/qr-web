file = ARGV[0]

found_first_occurance_of_rqrcode_module = false
end_to_remove = 0
end_to_skip = 0

File.read(file).lines.each do |line|
    if not line.include? '# frozen_string_literal: true'
        if line.include? ';'
            puts line
        elsif not found_first_occurance_of_rqrcode_module
            if line.include? 'module RQRCodeCore'
                found_first_occurance_of_rqrcode_module = true
            end

            puts line
        else
            if not line.include? 'module RQRCodeCore' 
                if /\A *end/.match?(line) && end_to_skip == 0
                    # skip
                elsif /\A *module .*/.match?(line) || 
                        /\A *def .*/.match?(line) || 
                        /\A.* if .*/.match?(line) || 
                        /\A *class .*/.match?(line) || 
                        /\A *unless .*/.match?(line)|| 
                        /\A.* do.*/.match?(line) ||
                        /\A *while .*/.match?(line) ||
                        /\A *case .*/.match?(line)

                    end_to_skip += 1
                    # puts "+1, #{end_to_skip}: #{line}"
                    puts line
                elsif /\A *end/.match?(line)
                    end_to_skip -= 1
                    puts line
                else
                    puts line
                end

            else
                end_to_remove += 1
            end
        end
    end
end