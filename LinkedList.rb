require_relative 'Node'

class LinkedList
  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      @size += 1
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node = new_node
      @size += 1
    end
  end

  def prepend(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      @size += 1
    else
      new_node.next_node = @head
      @head = new_node
      @size += 1
    end
  end

  def size
    size = 0
    current = @head
    while current
      size += 1
      current = current.next_node
    end
    return size
  end

  def head
    return "#{@head.value} -> #{@head.next_node ? @head.next_node.value : "nil"}"
  end

  def tail
    current = @head
    current = current.next_node while current.next_node
    return "#{current.value} -> #{current.next_node ? current.next_node.value : "nil"}"
  end

  def at(index)
    current = @head
    current_index = 0

    while current and current_index < index
      current = current.next_node
      current_index += 1
    end

    return "#{current.value} -> #{current.next_node ? current.next_node.value : "nil"}"
  end

  def pop
    current = @head
    current = current.next_node while current.next_node.next_node
    current.next_node = nil
  end

  def contains?(value)
    current = @head

    while current
      if current.value == value
        return true
      end
      current = current.next_node
    end
    return false
  end

  def find(value)
    current = @head
    current_index = 0

    while current
      if current.value == value
        return current_index
      end
      current = current.next_node
      current_index += 1
    end
    return nil
  end

  def to_s
    current = @head
    string = ""

    while current
      string = string + "( #{current.value} ) -> "
      current = current.next_node
    end

    return string + "nil"
  end
end


list = LinkedList.new

list.append(1)
puts list.size

list.prepend(3)
list.append(5)
puts list.size

puts list.to_s
