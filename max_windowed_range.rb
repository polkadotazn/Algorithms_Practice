# given an array and a window size, find the maximum difference in any window of the array

# naive solution
def mwr_naive(arr, w)
  current_max_range = nil
  i = 0
  while i < arr.length - w + 1
    mini_arr = arr.slice(i, w)
    range = mini_arr.max - mini_arr.min
    current_max_range = range if current_max_range == nil || range > current_max_range
    i += 1
  end
  range
end

# optimized solution using queues - MinMaxStackQueue to be precise
# first, stack and queue exercises:
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(val)
    @store.push(val)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(val)
    @store.push(val)
  end

  def pop
    @store.pop
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
end

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue
    @in_stack.push(val)
  end

  def dequeue
    queueify if @out_stack.empty?
    @out_stack.pop
  end

  def empty?
    @out_stack.empty? && @in_stack.empty?
  end

  def size
    @out_stack.size + @in_stack.size
  end


  private

  def queuify
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
end

class MinMaxStack
  def initialize
    @store = MyStack.new
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.peek[:value]
  end

  def max
    @store.peek[:max]
  end

  def min
    @store.peek[:min]
  end

  def push(val)
    @store.push({
      max: new_max(val),
      min: new_min(val),
      value: val
      })
  end


  private

  def new_max
    empty? ? val : [max_val].max
  end

  def new_min
    empty? ? val : [max_val].min
  end

end

class MinMaxStackQueue

  def initialize
    @in_stack = MinMaxStack.new
    @out_stack = MinMaxStack.new
  end

  def enqueue
    @in_stack.push(val)
  end

  def dequeue
    queueify if @out_stack.empty?
    @out_stack.pop
  end

  def empty?
    @out_stack.empty? && @in_stack.empty?
  end

  def size
    @out_stack.size + @in_stack.size
  end

  def max
    maxes = []
    maxes << @in_stack.max unless @in_stack.empty?
    maxes << @out_stack.max unless @out_stack.empty?
  end

  def min
    mins = []
    mins << @in_stack.min unless @in_stack.empty?
    mins << @out_stack.min unless @out_stack.empty?
  end


  private

  def queuify
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
end
