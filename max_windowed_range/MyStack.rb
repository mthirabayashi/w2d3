class MyStack
  def initialize
    @store = []
    @max = []
    @min = []
  end

  def pop
    @max.pop
    @min.pop
    @store.pop
  end

  def push(el)
    @store << el
    if @max.empty? || el>self.max_value
      @max.push(el)
    else
      @max.push(self.max_value)
    end
    if @min.empty? || el<self.min_value
      @min.push(el)
    else
      @min.push(self.min_value)
    end
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max_value
    @max.last
  end

  def min_value
    @min.last
  end

  private

  attr_accessor :max, :min

end
