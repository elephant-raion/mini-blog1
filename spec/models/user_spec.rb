require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(
      name: "yamada",
      email: "hoge@google.com",
      profile: "I work for my life.",
      url: "https://github.com/hogehoge",
      password: "foobarfoobar"
    )    
  end

  it "is valid with a name, email, profile, url, and password" do
    expect(@user).to be_valid
  end

  it "is invalid without a name" do
    @user.name = nil
    @user.valid?
    expect(@user.errors[:name]).to include(I18n.t("activerecord.errors.models.user.attributes.name.blank"))
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
        @user.valid?
        expect(@user.errors[:name]).to include(I18n.t("activerecord.errors.models.user.attributes.name.too_long"))
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
        @user.valid?
        expect(@user.errors[:name]).to include(I18n.t("activerecord.errors.models.user.attributes.name.invalid"))
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
        @user.valid?
        expect(@user.errors[:profile]).to include(I18n.t("activerecord.errors.models.user.attributes.profile.too_long"))
      end
    end
  end
end
