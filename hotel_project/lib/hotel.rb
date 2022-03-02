require_relative "room"

class Hotel

    def initialize(name, capacities)
        @name = name
        @rooms = {}
        capacities.each {|room_name, capacity| @rooms[room_name] = Room.new(capacity)}
        
    end

    def name 
        @name.split(" ").each {|word| word.capitalize! }.join(" ")
    end

    def rooms 
        @rooms
    end

    def room_exists?(room_name)
        @rooms.include?(room_name) ? true : false
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person) 
                p "check in successful" 
            else 
                p "sorry, room is full"
            end

        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each do |name , room|
            return true if !room.full?
        end
        false
    end

    def list_rooms
        @rooms.each do |name, room|
            puts name + ". " + "#{room.available_space}"
        end
    end







  
end
