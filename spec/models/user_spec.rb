require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  it "is valid with a name, email, profile, url, and password" do
    expect(@user).to be_valid
  end

  it "is invalid without a name" do
    @user.name = nil
    expect(@user).to be_invalid
    expect(@user.errors).to be_of_kind(:name, :blank)
  end

  describe "name's length" do
    context "when the length is 20 or less" do
      it "is valid" do
        @user.name = "a"*20
        expect(@user).to be_valid
      end
    end
    
    context "when the length is 21 or more" do
      it "is invalid" do
        @user.name = "a"*21
        expect(@user).to be_invalid
        expect(@user.errors).to be_of_kind(:name, :too_long)
      end
    end
  end

  describe "name's characters" do
    context "when the characters are alphabet only" do
      it "is valid" do
        @user.name = "takeshi"
        expect(@user).to be_valid
      end
    end

    context "when the characters are not alphabet only" do
      it "is invalid" do
        @user.name = "takeshi tanaka"
        expect(@user).to be_invalid
        expect(@user.errors).to be_of_kind(:name, :invalid)
      end
    end
  end

  describe "profile's length" do
    context "when the length is 200 or less" do
      it "is valid" do
        @user.profile = "a"*200
        expect(@user).to be_valid
      end
    end
    
    context "when the length is 201 or more" do
      it "is invalid" do
        @user.profile = "a"*201
        expect(@user).to be_invalid
        expect(@user.errors).to be_of_kind(:profile, :too_long)
      end
    end
  end
end
