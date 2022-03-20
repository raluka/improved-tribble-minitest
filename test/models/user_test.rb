# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid)
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

  test '#posts' do
    assert_equal 2, @user.posts.size
  end

  test '#recent' do
    assert_includes User.recent, users(:valid)
    refute_includes User.recent, users(:old)
  end

  test '#profile_photo_url' do
    assert_equal(
      'https://s.gravatar.com/avatar/d4c74594d841139328695756648b6bd6',
      @user.profile_photo_url
    )
  end
end
