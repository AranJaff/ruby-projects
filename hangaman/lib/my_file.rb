require 'json'

module MyFile

    def write_to_json(word, updated_word, true_guess, false_guess, id)
        hash = {
            :word => word,
            :updated_word => updated_word,
            :true_guess => true_guess,
            :false_guess => false_guess
        }

        Dir.mkdir('output') unless Dir.exist?('output')
      
        filename = "output/player_#{id}.json"

        File.write(filename, JSON.dump(hash))
    end

    def load_from_json(id)
        filename = "output/player_#{id}.json"

        json_str = File.read(filename).strip()

        JSON.parse(json_str)
    end
end