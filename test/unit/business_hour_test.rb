require 'test_helper'

class BusinessHourTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert BusinessHour.new.valid?
  end
end
