module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0..size - 1
      yield(self[i], i)
    end
    self
    to_
  end

  def my_select
    self unless block_given?
    result = []
    my_each { |element| result << element if yield(element) }
    result
  end

  def my_all?
    result = true
    my_each do |element|
      break if result == false

      result &&= if block_given?
                   yield(element)
                 else
                   element
                 end
    end
    result
  end

  def my_any?
    result = false
    my_each do |element|
      break if result == true

      result ||= if block_given?
                   yield(element)
                 else
                   element
                 end
    end
    result
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count
    return size unless block_given?

    count = 0
    my_each { |element| count += 1 if yield(element) }
    count
  end

  def my_map
    self unless block_given?

    mapped = []
    my_each { |element| mapped << yield(element) }
    mapped
  end

  def my_inject(initial_value)
    result = initial_value
    my_each { |element| result = yield(result, element) }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..size - 1
      yield(self[i])
    end
    self
  end
end
