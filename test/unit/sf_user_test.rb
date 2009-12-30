require 'test_helper'

class SfUserTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SfUser.new.valid?
  end
end
