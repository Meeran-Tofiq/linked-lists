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

    def append(val)
        temp = (Node.new(val))

        if empty?
            @head = temp 
            @tail = temp
            @head.next = @tail
        else
            @tail.next = temp
            @tail = temp
        end

        @size = @size + 1
    end

    def prepend(val)
        temp = Node.new(val)
        if empty?
            @head = temp
            @tail = temp
        else
            temp.next = @head
            @head = temp
        end

        @size += 1
    end

    def at(index)
        temp = head
        index.times { temp = temp.next}
        temp.value
    end

    def pop
        return if empty?

        temp = @head
        (size-2).times { temp = temp.next }
        temp.next = nil
        @tail = temp

        @size -= 1
    end

    def contains?(val)
        temp = @head
        until temp.nil?
            return true if temp.value == val
            temp = temp.next
        end

        false
    end

    def find(val)
        temp = @head
        i = 0
        until temp.nil?
            return i if temp.value == val
            temp = temp.next
            i += 1
        end
    end

    def to_s
        str = ""
        temp = head
        size.times { |_| str += "(#{temp.value}) -> "; temp = temp.next}
        str
    end

    def insert_at(index, val)
        return if index > @size+1

        new_node = Node.new(val)

        temp1 = @head
        (index-1).times { temp1 = temp1.next }
        temp2 = temp1.next

        temp1.next = new_node
        new_node.next = temp2

        @size += 1
    end

    def remove_at(index)
        return if index > @size

        temp = @head
        (index-1).times { temp = temp.next }

        temp.next = temp.next.next
        @size -= 1
    end

    def empty?
        @head == nil && @tail == nil
    end
end
