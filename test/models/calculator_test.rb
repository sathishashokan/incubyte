require "test_helper"

class CalculatorTest < ActiveSupport::TestCase
    def setup
        @calculator = Calculator.new()
    end

    test "should return 0 when input is empty" do
        assert_equal 0, @calculator.add("")
    end

    test "should return the sum for comma separated input" do
        input = "1,2,4,8"
        assert_equal 15, @calculator.add(input)
    end

    test "should handle new lines between numbers instead of commas" do
        input = "1,2\n4,8"
        assert_equal 15, @calculator.add(input)
    end

    test "should support different delimiters" do
        input = "//;\n1;2;4;8"
        assert_equal 15, @calculator.add(input)
    end

    test "should throw exception when the input contains negative" do
        error = assert_raises(ArgumentError) do
            input = "1,2,-8\n7,-5"
            @calculator.add(input)
        end

        assert_equal "negative numbers not allowed = -8,-5" , error.message
    end
end
