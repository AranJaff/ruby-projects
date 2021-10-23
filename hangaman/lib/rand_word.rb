require_relative "style.rb"

class RandWord
    attr_accessor :word

    def initialize
        choose_word()
    end

    def read_file
        File.readlines("5deck.txt")
    end

    def choose_word
        lines = read_file()
        x = true
        while x
            rand_num = rand(lines.length)

            if lines[rand_num].length.between?(6,13)
                secret = lines[rand_num].strip()
                @word = secret.downcase.split("")
                x = false
                puts "\n A random word is chosen. Now, you guess it char by char \n".bg_gray.black.italic.bold
                return @word
            end
        end
    end
end
