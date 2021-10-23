require_relative 'rand_word.rb'
require_relative 'my_file.rb'
require_relative 'comunicate.rb'
require_relative 'style.rb'

class Game
    extend MyFile
    extend Comunicate

    def self.play
        
        foreword()

        choice = start_or_load()
        if choice == '2'
            puts "Enter your file id:"
            id = gets.chomp()
            hash = load_from_json(id)

            word = hash["word"]
            arr = hash["updated_word"]
            true_guess = hash["true_guess"]
            false_guess = hash["false_guess"]
            count = 8 - false_guess.length

            p_arr(arr)
            p_true_guess(true_guess)
            p_false_guess(false_guess)
            p_count(count)
        elsif choice == '1'
            word = RandWord.new().word
            n = word.length
            arr = n.times.map {"-"}
            false_guess = []
            true_guess = []

            count = 8
        end

        while (count > 0) && (arr.include? "-")
            guess = guess_input()
            
            if guess == '1'
                break
            elsif guess == '2'
                puts "If you have played and saved before, just enter your file id".bg_cyan.black.bold
                puts "Unless, enter a new id number".bg_cyan.black.bold
                id = gets.chomp()
                write_to_json(word, arr, true_guess, false_guess, id)
                break
            end
            
            if word.include? guess
                if !(true_guess.include? guess)
                    true_guess.push(guess)
                end
            else
                if !(false_guess.include? guess)
                    false_guess.push(guess)
                end
                count -= 1
            end
    
            word.each_with_index do |char, index|
                if char == guess
                    arr[index] = char
                end
            end

            p_arr(arr)
            p_true_guess(true_guess)
            p_false_guess(false_guess)
            p_count(count)

            win_check(word, arr, count)
        end
    end

    def self.win_check(word, array, count)
        if array == word
            congrats()
        elsif count == 0
            pity()
            puts "\t The word was #{word.join()} \n".bg_yellow.black.bold
        end 
    end

end

Game.play()