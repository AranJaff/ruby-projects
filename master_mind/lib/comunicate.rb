require_relative 'style.rb'

class Comunicate
    CLAB = "\u{1f447}"
    BALLOON = "\u{1f388}"
    HUMAN = "\u{1f9d1}"
    ROBOT = "\u{1f916}"
    ROCKET = "\u{1f680}"
    HURRAY = "\u{1f389}"
    FLOWER = "\u{1f490}"

    def self.foreword
        str_0 = "\t\t" + "%" * 60
        str_1 = "\n\t\t Hey buddy, welcome to the land of codes and cryptography   \n"
        str_2 = "\t\t               <<<The Mastermind>>>                         \n"
        # str_3 = "\t\t                <Human> and <Robot>                         \n"
        str_4 = "\t\t          #{ROBOT} the <CodeMaker>; #{HUMAN} the <CodeBreaker>          \n"
        str_6 = "\t\t         only <Eight> chance to guess the code!             \n"
        str_7 = "\t\t                 choose from colors below                   \n"
        str_8 = "\t\t            #{"  1  ".bg_blue.black.bold} #{"  2  ".bg_green.black.bold} #{"  3  ".bg_red.black.bold} #{"  4  ".bg_yellow.black.bold} #{"  5  ".bg_magenta.black.bold} #{"  6  ".bg_brown.black.bold}\n"
        str_9 = "\t\t     for each round, enter a 4-digit number e,g, '3515'     \n"

        my_str = str_0 + "\n" + str_1 + str_2 + str_4 + str_6 + str_9 + str_7
        puts my_str.italic.black.bg_gray
        puts str_8
        puts "\n" + str_0.black.bg_gray
    end

    def self.win_message
        my_str2 = HURRAY + ROCKET + BALLOON + FLOWER + HURRAY + CLAB + BALLOON
        puts "\n" + my_str2 * 8
        puts "\n\t\t  Hurrray ,,, You Won! ,,, The Code Breaker! ,,, Hurray ,,, Well-done!!! ".bold.bg_gray.black
        puts "\n" + my_str2 * 8 + "\n\n\n\n"
    end

    def self.loss
        puts "\n\t\t Ohhhhh, You lose! ,,, if you wish u can try again!".bold.bg_gray.black + "\n\n\n" 
    end

    def self.input_length 
        puts "\n\t\t You have to enter a 4-digit number!".bold.bg_gray.black + "\n\n\n"
    end

    def self.input_int_range
        puts "\n\t\t You have to enter a 4-digit number from '1111' to '6666'".bold.bg_gray.black + "\n\n\n"
    end        

end
