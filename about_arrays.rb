require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new               # Creates a new Array object.
    assert_equal Array, empty_array.class # It is indeed an Array.
    assert_equal 0, empty_array.size      # It's empty. Size == 0.
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array          # "Empty" == size: 0 == [].

    array[0] = 1
    assert_equal [1], array         # Array[x] = y adds y to Array at x.

    array[1] = 2
    assert_equal [1, 2], array

    array << 333
    assert_equal [1, 2, 333], array 
    # << pushes the right value to the array on the left.
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    # Call the array with an index number to get the index's value.
    # #first and #last array methods also grab values from an array.
    # Negative indexes work through an array backwards with -1 being last.
    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    # You can grab a chunk of an array by defining a starting point and a
    # range of values you want.
    # array(index, range) #=> array value at index for the duration of range
    # Returns empty if the index is at the end of the array.
    # Returns nil if the index is out of the range of the array.
    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0]
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class          #=> #class returns object class.
    assert_not_equal [1,2,3,4,5], (1..5)      #=> .. is an inclusive range.
    assert_equal [1, 2, 3, 4, 5], (1..5).to_a #=> #to_a returns range as array
    assert_equal [1, 2, 3, 4], (1...5).to_a   #=> ... is an exclusive range.
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __, array[0..2]
    assert_equal __, array[0...2]
    assert_equal __, array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal __, array

    popped_value = array.pop
    assert_equal __, popped_value
    assert_equal __, array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal __, array

    shifted_value = array.shift
    assert_equal __, shifted_value
    assert_equal __, array
  end

end
