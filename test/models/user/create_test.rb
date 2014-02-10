require 'test_helper'

class User::CreateTest < ActiveSupport::TestCase
  def test_create_1_record
    assert_difference "User.count", 1 do
      create_random_user
    end
  end

  def test_create_3_records
    assert_difference "User.count", 3 do
      3.times { create_random_user }
    end
  end

  def test_create_10_records
    assert_difference "User.count", 10 do
      10.times { create_random_user }
    end
  end

  def create_random_user
    random = SecureRandom.hex(8)
    User.create! first_name: random,
                 last_name: random,
                 company: random,
                 title: random,
                 account: "member",
                 email: "#{random}@example.com",
                 password: random,
                 password_confirmation: random
  end

end
