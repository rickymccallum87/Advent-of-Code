# Ridiculous instructions indicated on the Easter Bunny Recruiting Document
sequence = ['R3', 'L5', 'R2', 'L1', 'L2', 'R5', 'L2', 'R2', 'L2', 'L2', 'L1', 'R2', 'L2', 'R4', 'R4', 'R1', 'L2', 'L3', 'R3', 'L1', 'R2', 'L2', 'L4', 'R4', 'R5', 'L3', 'R3', 'L3', 'L3', 'R4', 'R5', 'L3', 'R3', 'L5', 'L1', 'L2', 'R2', 'L1', 'R3', 'R1', 'L1', 'R187', 'L1', 'R2', 'R47', 'L5', 'L1', 'L2', 'R4', 'R3', 'L3', 'R3', 'R4', 'R1', 'R3', 'L1', 'L4', 'L1', 'R2', 'L1', 'R4', 'R5', 'L1', 'R77', 'L5', 'L4', 'R3', 'L2', 'R4', 'R5', 'R5', 'L2', 'L2', 'R2', 'R5', 'L2', 'R194', 'R5', 'L2', 'R4', 'L5', 'L4', 'L2', 'R5', 'L3', 'L2', 'L5', 'R5', 'R2', 'L3', 'R3', 'R1', 'L4', 'R2', 'L1', 'R5', 'L1', 'R5', 'L1', 'L1', 'R3', 'L1', 'R5', 'R2', 'R5', 'R5', 'L4', 'L5', 'L5', 'L5', 'R3', 'L2', 'L5', 'L4', 'R3', 'R1', 'R1', 'R4', 'L2', 'L4', 'R5', 'R5', 'R4', 'L2', 'L2', 'R5', 'R5', 'L5', 'L2', 'R4', 'R4', 'L4', 'R1', 'L3', 'R1', 'L1', 'L1', 'L1', 'L4', 'R5', 'R4', 'L4', 'L4', 'R5', 'R3', 'L2', 'L2', 'R3', 'R1', 'R4', 'L3', 'R1', 'L4', 'R3', 'L3', 'L2', 'R2', 'R2', 'R2', 'L1', 'L4', 'R3', 'R2', 'R2', 'L3', 'R2', 'L3', 'L2', 'R4', 'L2', 'R3', 'L4', 'R5', 'R4', 'R1', 'R5', 'R3']

class Elf

    def initialize
        @location = [0, 0] # airdropped coordinates
        @compass = ['N', 'E', 'S', 'W'] # compass headings, sorted clockwise
        @facing = 'N' # face North per instructions
	@visited = [] # list of locations visited
        @visited_twice = [] # list of locations re-visited
    end

    # Follow instructions programmatically
    def follow sequence
        # Check each instruction
        for instruction in sequence
            # get first character
            direction = instruction[0]
            # print 't'+direction # DEBUG
            turn(direction)
            # get 2nd character to end
            blocks = instruction[1..-1].to_i
            # print blocks.to_s+'b' # DEBUG
            walk(blocks)
        end
    end

    # Turn to the left or right
    def turn direction
        if direction == 'R'
            # change to next heading
            new_facing = wrap_compass(@compass.index(@facing) + 1)
        elsif direction == 'L'
            # change to previous heading
            new_facing = wrap_compass(@compass.index(@facing) - 1)
        end
        @facing = @compass[new_facing]
        # print 'f'+@facing # DEBUG
    end

    # Wrap around compass 'clockface' if necessary
    def wrap_compass new_facing
        if new_facing < 0
            new_facing = 3
        elsif new_facing > 3
            new_facing = 0
        end
        new_facing
    end

    # Walk forward specified number of blocks
    def walk blocks
        (1..blocks).each do
            # based on current heading, move 1 block
            if @facing == 'N'
                @location[1] += 1 # y+
            elsif @facing == 'E'
                @location[0] += 1 # x+
            elsif @facing == 'S'
                @location[1] -= 1 # y-
            elsif @facing == 'W'
                @location[0] -= 1 # x-
            end
            # check whether this is Easter Bunny HQ
            if @visited.include? @location
                @visited_twice.push(@location.dup)
                # print 'x'+@location.to_s # DEBUG
            end
            # print @location.to_s # DEBUG
            # record locations visited
            @visited.push(@location.dup)
        end
    end

    # Report current location
    def location
        @location
    end

    # Report Easter Bunny HQ location
    def bunny_HQ
        @visited_twice.first
    end

end

# Airdrop an elf into the city
elf = Elf.new

# Have elf follow the instructions
elf.follow(sequence)

# Report back to Santa where the instructions led
puts 'Destination: ' + elf.location.to_s

# Calculate elf's distance from the starting point
puts '(' + (elf.location[0].abs + elf.location[1].abs).to_s + ' blocks away)'

# Report location of Easter Bunny HQ
puts 'Easter Bunny HQ: ' + elf.bunny_HQ.to_s

# Calculate Easter Bunny HQ's distance from the starting point
puts '(' + (elf.bunny_HQ[0].abs + elf.bunny_HQ[1].abs).to_s + ' blocks away)'
