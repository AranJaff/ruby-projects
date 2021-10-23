require_relative 'style.rb'
require_relative 'board.rb'

class Display
    extend Board

    def self.row_circles(array = [0,0,0,0])
        str = ""
        array.map do |color|
            str += " "
            case color
            when 0
                str += "\u26ab"
            when 1
                str += circle_color('blue')
            when 2
                str += circle_color('green')
            when 3
                str += circle_color('red')
            when 4
                str += circle_color('yellow')
            when 5
                str += circle_color('purple')
            when 6
                str += circle_color('orange')
            end
        end
        str
    end

    def self.row_pegs(peg_array)
        str = ""
        peg_array[0].times do
            str += "\u25cf".red
        end
        peg_array[1].times do 
            str += "\u25cf"
        end
        n = 4 - peg_array[0] - peg_array[1]
        n.times do
            str += " "
        end
        str
    end

    def self.paint(circles, pegs)
        system("clear")
        puts "\n\t\t #{" 1 ".bg_blue.black.bold} #{" 2 ".bg_green.black.bold} #{" 3 ".bg_red.black.bold} #{" 4 ".bg_yellow.black.bold} #{" 5 ".bg_magenta.black.bold} #{" 6 ".bg_brown.black.bold}\n\n"

        default_circles = Display.row_circles([0,0,0,0])
        default_pegs = Display.row_pegs([0,0])

        top_margin()
        row_show(circles[0], pegs[0])

        for k in (1..7)
            middle_margin()
            
            if circles[k] != nil
                row_show(circles[k], pegs[k])
            else
                row_show(default_circles, default_pegs)
            end
        end
        bottom_margin()
        puts "\n\n"
    end

end