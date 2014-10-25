#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutAsserts < Neo::Koan

  # We shall contemplate truth by testing reality, via asserts.
  def test_assert_truth
    assert true         # assert checks if something is true and moves on or 
                        # stops if it is false.
  end

  # assert [condition], ["message"]
  # Checks for truth and moves on or stops and displays the message.
  def test_assert_with_message
    assert true, "This should be true -- Please fix this"
  end

  # To understand reality, we must compare our expectations against
  # reality.
  def test_assert_equality
    expected_value = 2      # condition 1
    actual_value = 1 + 1    # condition 2

    # As above, asserts if the relationship between the conditions is true. If it is false, assert throws up a default error message.
    assert expected_value == actual_value
  end

  # Some ways of asserting equality are better than others.
  def test_a_better_way_of_asserting_equality
    expected_value = 2
    actual_value = 1 + 1

    # Same as above without the [==]. assert_equal automatically tests two conditions for equality.
    assert_equal expected_value, actual_value
  end

  # In testing, you can omit values to make them false, forcing the user to fill them in in order to pass.
  def test_fill_in_values
    assert_equal 2, 1 + 1
  end
end
