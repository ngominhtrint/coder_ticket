require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    specify 'for password' do
      user = build(:user, email: "test@gmail.com")
      expect(user).to validate_presence_of(:password)
      expect(user).to allow_value('abcdef').for(:password)
      expect(user).to_not allow_value('1234').for(:password)
    end
  end
end
