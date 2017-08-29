# Ridiculous instructions indicated on the Easter Bunny Recruiting Document
sequence = ['R3', 'L5', 'R2', 'L1', 'L2', 'R5', 'L2', 'R2', 'L2', 'L2', 'L1', 'R2', 'L2', 'R4', 'R4', 'R1', 'L2', 'L3', 'R3', 'L1', 'R2', 'L2', 'L4', 'R4', 'R5', 'L3', 'R3', 'L3', 'L3', 'R4', 'R5', 'L3', 'R3', 'L5', 'L1', 'L2', 'R2', 'L1', 'R3', 'R1', 'L1', 'R187', 'L1', 'R2', 'R47', 'L5', 'L1', 'L2', 'R4', 'R3', 'L3', 'R3', 'R4', 'R1', 'R3', 'L1', 'L4', 'L1', 'R2', 'L1', 'R4', 'R5', 'L1', 'R77', 'L5', 'L4', 'R3', 'L2', 'R4', 'R5', 'R5', 'L2', 'L2', 'R2', 'R5', 'L2', 'R194', 'R5', 'L2', 'R4', 'L5', 'L4', 'L2', 'R5', 'L3', 'L2', 'L5', 'R5', 'R2', 'L3', 'R3', 'R1', 'L4', 'R2', 'L1', 'R5', 'L1', 'R5', 'L1', 'L1', 'R3', 'L1', 'R5', 'R2', 'R5', 'R5', 'L4', 'L5', 'L5', 'L5', 'R3', 'L2', 'L5', 'L4', 'R3', 'R1', 'R1', 'R4', 'L2', 'L4', 'R5', 'R5', 'R4', 'L2', 'L2', 'R5', 'R5', 'L5', 'L2', 'R4', 'R4', 'L4', 'R1', 'L3', 'R1', 'L1', 'L1', 'L1', 'L4', 'R5', 'R4', 'L4', 'L4', 'R5', 'R3', 'L2', 'L2', 'R3', 'R1', 'R4', 'L3', 'R1', 'L4', 'R3', 'L3', 'L2', 'R2', 'R2', 'R2', 'L1', 'L4', 'R3', 'R2', 'R2', 'L3', 'R2', 'L3', 'L2', 'R4', 'L2', 'R3', 'L4', 'R5', 'R4', 'R1', 'R5', 'R3']

class Elf

    def initialize
        @location = [0, 0] # airdropped coordinates
        @compass = ['N', 'E', 'S', 'W'] # compass headings, sorted clockwise
        @facing = 'N' # face North per instructions
        @destination = [] # unknown
    end

    # Turn to the left or right
    def turn direction
        # find current heading on compass
        if direction == 'R'
            # change to next heading
        elsif direction == 'L'
            # change to previous heading
        end
    end

    # Walk forward specified number of blocks
    def walk blocks
        # based on current heading
        if @facing == 'N'
            @location[1] += blocks
        elsif @facing == 'E'
            @location[0] += blocks
        elsif @facing == 'S'
            @location[1] -= blocks
        elsif @facing == 'W'
            @location[0] -= blocks
        end
    end

    # Calculate destination's distance from the starting point
    def distance destination
        return abs(@destination[0]) + abs(@destination[1])
    end

    # Follow instructions programmatically
    def follow sequence
        # Check each instruction
        for i in sequence
            # turn direction (sequence[i][0])
            # walk blocks
        end
    end
end
