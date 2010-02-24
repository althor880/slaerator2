require 'test_helper'

class SlaRuleTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SlaRule.new.valid?
  end
end
