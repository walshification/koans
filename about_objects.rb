require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    # Seriously, everything.
    assert_equal true, 1.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    assert_equal true, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s    # #to_s Returns value of object as string
    assert_equal "", nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal "123", 123.inspect  # #inspect returns string version of name
    assert_equal "nil", nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal Fixnum, obj.object_id.class 
    # Object classes include: Fixnum, Bignum, Decimal, String, Integer, Float
    # Method, Exception, etc.
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal true, obj.object_id != another_obj.object_id
    # puts obj.object_id            #=> 70231863459620
    # puts another_obj.object_id    #=> 70231863459600
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id
    assert_equal 3, 1.object_id
    assert_equal 5, 2.object_id
    assert_equal 201, 100.object_id

    # THINK ABOUT IT:
    # So object IDs for small integers are always odd numbers. In fact,
    # object_id = (value * 2) + 1 for small integers. Upon researching,
    # this has to do with Ruby being built off C and because Ruby stores
    # the value of a small integer in the id itself. I don't know C well
    # enough to go much further than that.
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal true, obj           != copy
    assert_equal true, obj.object_id != copy.object_id
    # Every object has a unique id, even clones.
  end
end
