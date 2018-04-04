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

  def stack(val)
    @store.push(val)
  end

  def destack
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
