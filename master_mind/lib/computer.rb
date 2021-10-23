class Computer
    @@code = []

    def initialize
        rand_color_maker()
    end

    def rand_color_maker
        @@code = 4.times.map{1 + Random.rand(6)}
    end

    def count_code_colors
        code_count = 7.times.map{0}
                                    # index zero is useless!
        @@code.map do |i|
            code_count[i] += 1
        end
        code_count
    end

    def code_reader
        @@code
    end

end

