module Comunicate

    def foreword
        puts "\n\n"
        puts "\t  WELCOME TO THE BEAUTIFUL GAME OF HANGAMAN               ".bg_gray.black.italic.bold
        puts "\t  COMPUTER CHOOSE A RANDOM WORD YOU GUESS WHAT IT IS      ".bg_gray.black.italic.bold
        puts "\t  EACH TIME YOU GUESS ONE CHARACTER                       ".bg_gray.black.italic.bold
        puts "\t  COMPUTER WOULD TELL IF IT'S CORRECT OR NOT              ".bg_gray.black.italic.bold
        puts "\t  YOU CAN EITHER START A NEW GAME OR LOAD ONE             ".bg_gray.black.italic.bold
        puts "\t  AFTER FINISHING, YOU CAN EITHER EXIT OR SAVE YOUR GAME  ".bg_gray.black.italic.bold
        puts "\t  HAVE FUN :)                                             \n\n\n".bg_gray.black.italic.bold
    end

    def p_arr(array)
        system('clear')
        puts "updated secret word: \n".bg_yellow.black.bold
        print "\t"
        array.each {|item| print item.bg_gray.black.bold}
        puts "\n\n"
    end

    def p_true_guess(array)
        puts "correct guess: \n".bg_yellow.black.bold
        print "\t"
        array.each {|item| print " " + item.green.bold+ " "}
        puts "\n\n"
    end

    def p_false_guess(array)
        puts "missed guess: \n".bg_yellow.black.bold
        print "\t"
        array.each {|item| print " " + item.red.bold + " "}
        puts "\n\n"
    end

    def p_count(count)
        puts "You have #{count.to_s.blink} chances left".bg_cyan.red.bold
        puts "\n\n"
    end

    def guess_input
        puts "enter your guess: ".bg_cyan.black.bold
        puts "you can also choose 'exit' or 'save' ".bg_cyan.black.bold
        puts "[1] exit"
        puts "[2] save"

        return gets.chomp()
    end

    def start_or_load
        puts "You can load a saved game or start a new one: \n".bg_cyan.black.bold
        puts "[1] new game"
        puts "[2] load game"
        
        return gets.chomp()
    end

    def congrats
        puts "\n\t ,,, Congradulations! You Won  \n\n".bg_gray.red.italic.bold
    end

    def pity
        puts "\n\t ,,, Sorry, you lost  \n\n".bg_gray.red.italic.bold

    end
end