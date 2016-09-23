require_relative 'MyStack'

class StackQueue

  def initialize
    @inStack = MyStack.new
    @outStack = MyStack.new
  end

  def enqueue(el)
    @inStack.push(el)
  end

  def dequeue
    return nil if self.empty?
    if @outStack.empty?
      until @inStack.empty?
        temp = @inStack.pop
        @outStack.push(temp)
      end
    end
    @outStack.pop
  end

  def size
    @inStack.size + @outStack.size
  end

  def empty?
    @inStack.empty? && @outStack.empty?
  end

  def max
    if @inStack.empty?
      return @outStack.max_value
    elsif @outStack.empty?
      return @inStack.max_value
    else
      return @inStack.max_value > @outStack.max_value ? @inStack.max_value : @outStack.max_value
    end
  end

  def min
    if @inStack.empty?
      return @outStack.min_value
    elsif @outStack.empty?
      return @inStack.min_value
    else
      return @inStack.min_value < @outStack.min_value ? @inStack.min_value : @outStack.min_value
    end
  end
end
