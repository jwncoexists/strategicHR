require 'test_helper'

class User::ValidTest < ActiveSupport::TestCase
  def test_can_be_valid
    member = users :member
    assert_valid member
  end

  def test_invalid_without_email
    member = users :member
    member.email = nil
    refute_valid member
    assert_includes member.errors[:email], "can't be blank"
  end

  def test_invalid_with_existing_email
    member = users :member
    member2 = User.create email: member.email,
                        first_name: "member2",
                        last_name: "member2",
                        password: "member2",
                        password_confirmation: "member2"
    refute_valid member2
    assert_includes member2.errors[:email], "has already been taken"
  end

  def assert_valid user
    assert_predicate user, :valid?
  end

  def refute_valid user
    refute_predicate user, :valid?
  end
end