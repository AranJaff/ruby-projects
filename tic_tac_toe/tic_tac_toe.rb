
$board_hash = {}

for i in (1..9) do
    $board_hash[i] = i
end

class Board
    def self.display
        puts ""
        $board_hash.map do |k,v|
            if k % 3 == 0
                print "  #{v}  \n"
                print "- - -+- - -+- - -\n" unless k == 9
            else
                print "  #{v}  |"
            end
        end
        puts " "
    end
end

class Player
    attr_accessor :name, :weapon

    def initialize(name, weapon)
        @name = name
        @weapon = weapon
    end
    def location(room)
        $board_hash[room.to_i] = @weapon
    end
end

class Game
    @@player_one
    @@player_two

    def initialize
        puts "\n\n\t\tWELCOME TO TIC-TAC-TOE GAME\n\t
              A GAME BETWEEN TWO HUMAN PLAYER\n\t
              PLEASE ENTER YOUR NAME AND WEAPON\n\t
              WEAPONS CAN BE ANY ASCII CHAR\n\t
              PUT THREE IN A LINE AND YOU ARE THE WINNER! :)\n\n"
    end

    def get_data
        ["FIRST", "SECOND"].map do |i|
            puts "#{i} PLAYER, ENTER YOUR NAME:"
            name = gets.chomp
            puts "#{name}, ENTER YOUR WEAPON:"
            weapon = gets.chomp
            print "\n\t#{name} YOU ARE THE #{i} PLAYER AND YOUR WEAPON IS #{weapon}\n\n"
            if i == "FIRST"
                @@player_one = Player.new(name, weapon)
            else
                @@player_two = Player.new(name, weapon)
            end
        end
    end

    def game_board
        for i in (1..9)
            print "\n\n\n\n\n\n"
            if check_weapon_difference == true
                break
            end
            player = (i % 2 != 0) ? @@player_one : @@player_two
            puts "#{player.name}, enter a number: "
            room = gets.chomp
            if check_room_correctness(room) == true
                break
            end
            player.location(room)
            if (check_board($board_hash, player.weapon) == true)
                print "\nCongrats! #{player.name} is the winner.\n"
                Board.display
                break
            end
            Board.display
        end
    end

    def check_board(board, weapon)
        b = board
        w = weapon
        [1,4,7].map do |i|
            if (b[i] == w && b[i+1] == w && b[i+2] == w)
                return true
            end
        end
        [1,2,3].map do |i|
            if (b[i] == w && b[i+3] == w && b[i+6] == w)
                return true
            end
        end
        [2,4].map do |i|
            if (b[5-i] == w && b[5] == w && b[5+i] == w)
                return true
            end
        end
    end

    def check_room_correctness(room)
        $board_hash.map do |k,v|
            if (k == room.to_i) && (v == @@player_one.weapon || v == @@player_two.weapon)
                puts "Game Over! Don't enter the same room number"
                return true
            elsif !room.to_i.between?(1,9)
                puts "Game Over! enter correct room number"
                return true
            end
        end
    end

    def check_weapon_difference
        if @@player_one.weapon == @@player_two.weapon
            puts "Game Over! enter two different weapons\n"
            return true
        end
    end
end

game = Game.new()
game.get_data
Board.display
game.game_board