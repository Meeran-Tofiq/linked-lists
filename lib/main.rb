require 'pry-byebug'

class Node
    attr_reader :value, :next
    attr_writer :next
    def initialize(value=nil)
        @value = value
        @next = nil
    end
end

class LinkedList
    attr_reader :head, :tail, :size
    attr_writer :head, :tail, :size
    
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

end