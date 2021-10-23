module Hum
    def hey
        puts "enter number: "
        @number = gets.chomp()
        if @number == "1"
            system("clear")
        else
            puts "Not yet"
        end
    end

    def wey
        @number += "12"
    end

    def readerrr
        puts @number
    end
end

class Test
    include Hum
    @@temp = 0

    def add
        @@temp += 123
    end

    def subtract
        @@temp -= 23
    end

    def reader
        @@temp
    end
end

test = Test.new()
test.hey