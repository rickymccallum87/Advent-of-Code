# Ridiculous instructions indicated on the Easter Bunny Recruiting Document
sequence = ['R3', 'L5', 'R2', 'L1', 'L2', 'R5', 'L2', 'R2', 'L2', 'L2', 'L1', 'R2', 'L2', 'R4', 'R4', 'R1', 'L2', 'L3', 'R3', 'L1', 'R2', 'L2', 'L4', 'R4', 'R5', 'L3', 'R3', 'L3', 'L3', 'R4', 'R5', 'L3', 'R3', 'L5', 'L1', 'L2', 'R2', 'L1', 'R3', 'R1', 'L1', 'R187', 'L1', 'R2', 'R47', 'L5', 'L1', 'L2', 'R4', 'R3', 'L3', 'R3', 'R4', 'R1', 'R3', 'L1', 'L4', 'L1', 'R2', 'L1', 'R4', 'R5', 'L1', 'R77', 'L5', 'L4', 'R3', 'L2', 'R4', 'R5', 'R5', 'L2', 'L2', 'R2', 'R5', 'L2', 'R194', 'R5', 'L2', 'R4', 'L5', 'L4', 'L2', 'R5', 'L3', 'L2', 'L5', 'R5', 'R2', 'L3', 'R3', 'R1', 'L4', 'R2', 'L1', 'R5', 'L1', 'R5', 'L1', 'L1', 'R3', 'L1', 'R5', 'R2', 'R5', 'R5', 'L4', 'L5', 'L5', 'L5', 'R3', 'L2', 'L5', 'L4', 'R3', 'R1', 'R1', 'R4', 'L2', 'L4', 'R5', 'R5', 'R4', 'L2', 'L2', 'R5', 'R5', 'L5', 'L2', 'R4', 'R4', 'L4', 'R1', 'L3', 'R1', 'L1', 'L1', 'L1', 'L4', 'R5', 'R4', 'L4', 'L4', 'R5', 'R3', 'L2', 'L2', 'R3', 'R1', 'R4', 'L3', 'R1', 'L4', 'R3', 'L3', 'L2', 'R2', 'R2', 'R2', 'L1', 'L4', 'R3', 'R2', 'R2', 'L3', 'R2', 'L3', 'L2', 'R4', 'L2', 'R3', 'L4', 'R5', 'R4', 'R1', 'R5', 'R3']

class Elf

    def initialize
        @location = [0, 0] # airdropped coordinates
        @compass = ['N', 'E', 'S', 'W'] # compass headings, sorted clockwise
        @facing = 'N' # face North per instructions
    end

    # Turn to the left or right
    def turn direction
        # find current heading on compass
        if direction == 'R'
            # change to next heading
            new_facing = wrap_compass(@compass.index(@facing) + 1)
        elsif direction == 'L'
            # change to previous heading
            new_facing = wrap_compass(@compass.index(@facing) - 1)
        end

        @facing = @compass[new_facing]
    end

    # Wrap around compass 'clockface' if necessary
    def wrap_compass new_facing
        if new_facing == -1
            new_facing = 3
        elsif new_facing == 4
            new_facing = 0
        end
        new_facing
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

    # Follow instructions programmatically
    def follow sequence
        # Check each instruction
        for instruction in sequence
            # turn direction: first character
            direction = instruction[0]
            turn(direction)
            # walk blocks: 2nd character to end
            blocks = instruction[1..-1].to_i
            walk(blocks)
        end
    end

    # Calculate location's distance from the starting point
    def distance
        @location[0].abs + @location[1].abs
    end

    # Report back to Santa where instructions led
    def report
        @location
    end

end

elf = Elf.new
elf.follow(sequence)
puts elf.report
puts elf.distance
