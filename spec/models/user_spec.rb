require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    before do
      @user = User.create(first_name: "Tara", email: "t@t.com", password: "password", password_confirmation: "password", last_name: "MacKinnon")
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is not valid without password" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid without password_confirmation" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "is not valid when password and password_confirmation don't match" do
      @user.password = "pAssWord"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "is not valid when email is already in db" do
      @user1 = User.create(first_name: "Penny", email: "T@T.com", password: "password", password_confirmation: "password", last_name: "Lane")
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end

    it "is not valid without an email" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "is not valid without a first name" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid without a last name" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid with a password less than 4 characters" do
      @user.password = "123"
      @user.password_confirmation = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    before do
      @user2 = User.create(first_name: "Tara", email: "t@t.com", password: "password", password_confirmation: "password", last_name: "MacKinnon")
    end

    it "aunthenticates and returns a user if crendentials match exactly" do
      email = "t@t.com"
      password = "password"
      @user3 = User.authenticate_with_credentials(email, password)
      expect(@user2).to eq(@user3)
    end

    it "returns nil if email is not authenticated" do
      email = "a@a.com"
      password = "password"
      @user3 = User.authenticate_with_credentials(email, password)
      expect(@user2).to_not eq(@user3)
    end

    it "returns nil if password is not authenticated" do
      email = "t@t.com"
      password = "PassWoRd"
      @user3 = User.authenticate_with_credentials(email, password)
      expect(@user2).to_not eq(@user3)
    end

    it "aunthenticates and returns a user if email has whitespace around it but matches the crendentials" do
      email = " t@t.com "
      password = "password"
      @user3 = User.authenticate_with_credentials(email, password)
      expect(@user2).to eq(@user3)
    end

    it "aunthenticates and returns a user if email has different cases but still matches" do
      email = "T@T.com"
      password = "password"
      @user3 = User.authenticate_with_credentials(email, password)
      expect(@user2).to eq(@user3)
    end


  end
end
