require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    before do
      @user = User.new(name: "Tara", email: "t@t.com", password: "password", password_confirmation: "password")
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is not valid without password" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "is not valid without password_confirmation" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "is not valid when password and password_confirmation don't match" do
      @user.password = "pAssWord"
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end



  end

end
