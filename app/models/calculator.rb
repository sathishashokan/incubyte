class Calculator
    def add(str)
        return 0 if str.empty?

        if str.start_with?("//")
            delimiter, numbers = str.split("\n",2)
            delimiter = delimiter[2..]
        else
            delimiter = ","
            numbers = str
        end
        numbers = numbers.gsub("\n",delimiter)
        numbers = numbers.split(delimiter).map(&:to_i)
        negative_numbers = numbers.select(&:negative?)
        raise ArgumentError, "negative numbers not allowed = #{negative_numbers.join(",")}" if negative_numbers.any?
        numbers.sum
    end
end