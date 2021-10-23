require_relative "comunicate.rb"

class Human

    def initialize
        @choice = []
        choose_color()
    end
    
    def choose_color
        puts "Enter a 4-digit number: "
        input = gets.chomp().split("")

        input.map do |item|
            @choice.push(item.to_i) 
        end
        # p @choice
    end

    def count_human_choice
        human_count = 7.times.map{0}
        @choice.map do |i|
            human_count[i] += 1
        end
        human_count
    end

    def human_choice_reader
        @choice
    end

end
