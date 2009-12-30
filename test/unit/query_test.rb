require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Query.new.valid?
  end
end
