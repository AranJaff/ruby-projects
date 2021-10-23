# board and margins

module Board

    HOR = "\u2550"
    VER = "\u2551"
    T_LEFT = "\u2554"
    T_RIGHT = "\u2557"
    B_LEFT = "\u255a"
    B_RIGHT = "\u255d"
    CROSS_DOWN = "\u2566"
    CROSS_UP = "\u2569"
    CROSS_RIGHT = "\u2563"
    CROSS_LEFT = "\u2560"
    CROSS_ALL = "\u256c"

    def circle_color(code)
        {
            'red' => "\u{1f534}",
            'blue' => "\u{1f535}",
            'green' => "\u{1f7e2}",
            'yellow' => "\u{1f7e1}",
            'purple' => "\u{1f7e3}",
            'orange' => "\u{1f7e0}"
        }[code]
    end
    
    def top_margin
        puts "\t\t" + T_LEFT + hor_left + CROSS_DOWN + hor_right + T_RIGHT + "\n"
    end

    def bottom_margin
        puts "\t\t" + B_LEFT + hor_left + CROSS_UP + hor_right + B_RIGHT + "\n"
    end

    def middle_margin
        puts "\t\t" + CROSS_LEFT + hor_left + CROSS_ALL + hor_right + CROSS_RIGHT + "\n"
    end

    def hor_left
        HOR * 15
    end

    def hor_right
        HOR * 6
    end

    def row_show(circles, pegs)
        puts "\t\t" + VER + " " + circles + "  " + VER + " " + pegs + " " + VER + "\n"
    end

end