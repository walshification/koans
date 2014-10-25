require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutNil < Neo::Koan
  def test_nil_is_an_object
    # Ruby's nil is an object, different from other languages' NULL.
    # is_a?(class) method tests if the object is the parameter class.
    assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # The following begin/rescue/end code block captures the exception and
    # makes some assertions about it. An exception here is an error that would
    # normally terminate the program; the rescue prevents termination.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?
      assert_equal NoMethodError, ex.class

      # The message that is attached to this exception:
      assert_match(/undefined method `some_method_nil_doesnt_know_about' for nil:NilClass/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert_equal true, nil.nil?   # Tests if object is nil, returns true/false.
    assert_equal "", nil.to_s     # Returns value of object as string.
    assert_equal "nil", nil.inspect  # Returns name of object as string?

    # Barring fringe cases in which a user defines something that is not nil
    # to return true under #nil?, both #nil? and 'obj == nil' are functionally 
    # identical. However, technically speaking, using the method is more
    # elegant/efficient because it is not executing a micro comparison.
  end

end
