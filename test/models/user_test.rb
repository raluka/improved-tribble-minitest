# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'John', email: 'john@example.com')
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.name = nil
    refute @user.valid?, 'user is valid without name'
    assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end
end
