require 'test_helper'

class SfRecordTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SfRecordType.new.valid?
  end
end
