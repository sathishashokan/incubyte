class Calculator
    def add(str)
        if str.empty?
            return 0
        end

        if str.start_with?("//")
            delimiter = str.slice(2)
            numbers = str.slice(4,str.length)
            numbers = numbers.gsub("\n",delimiter)
        else
            delimiter = ","
            numbers = str
            numbers = numbers.gsub("\n",delimiter)
        end
        numbers = numbers.split(delimiter)
        final_numbers = []
        numbers.each do |n|
            final_numbers << n.to_i
        end
        final_numbers.each do |n|
            if n.negative?
                raise ArgumentError, "negative numbers not allowed"
            end
        end
        final_numbers.sum
    end
end