require_relative "computer.rb"
require_relative "human.rb"
require_relative "display.rb"
require_relative "style.rb"
require_relative "board.rb"
require_relative "comunicate.rb"


class Game
    def play
        computer = Computer.new()
        c_array = computer.code_reader()
        c_count = computer.count_code_colors()

        total_circles = []
        total_pegs = []

        for i in (0..7)
            human = Human.new()
            h_array = human.human_choice_reader()

            if h_array.length() != 4
                Comunicate.input_length()
                break
            end

            h_array.map do |item|
                if !item.between?(1,6)
                    Comunicate.input_int_range()
                    break
                end
            end

            h_count = human.count_human_choice()

            total_circles.push(Display.row_circles(h_array))
            peg_array = peg_counter(c_array, h_array, c_count, h_count)
            total_pegs.push(Display.row_pegs(peg_array))

            Display.paint(total_circles, total_pegs)

            if peg_array[0] == 4
                Comunicate.win_message()
                break
            end

            if i == 7
                Comunicate.loss()
            end
        end
    end

    def peg_counter(c_array, h_array , c_count, h_count)
                                     
        temp_c = Array.new(c_count)    # Be aware of deep/shallow copying of arrays !!!  
        temp_h = Array.new(h_count)
        red = 0
        white = 0

        for i in (0..3)
            if c_array[i] == h_array[i]
                red += 1
                temp_c[c_array[i]] -= 1
                temp_h[c_array[i]] -= 1            
            end
        end

        for i in (1..6)
            if temp_c[i] >= 1 && temp_h[i] >= 1
                white += [temp_c[i], temp_h[i]].min
            end
        end
        return [red, white]
    end

    def win_check(red_pegs)
        if red_pegs == 4
            Comunicate.win_message
        end
    end

end

game = Game.new

game.play()
