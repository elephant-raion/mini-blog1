require 'rails_helper'

RSpec.describe Micropost, type: :model do
  

  before do
    user = User.create(
      name: "yamada",
      email: "hoge@google.com",
      profile: "I work for my life.",
      url: "https://github.com/hogehoge",
      password: "foobarfoobar"
    )
    @micropost = user.microposts.build(
      content: "This is a sample micropost."
    )
  end

  it "is valid with a content, and  user id" do
    expect(@micropost).to be_valid
  end

  it "is invalid without a user id" do
    @micropost.user_id = nil
    @micropost.valid?
    expect(@micropost.errors[:user_id]).to include(I18n.t("activerecord.errors.models.micropost.attributes.user_id.blank"))
  end
  
  it "is invalid without a content" do
    @micropost.content = nil
    @micropost.valid?
    expect(@micropost.errors[:content]).to include(I18n.t("activerecord.errors.models.micropost.attributes.content.blank"))
  end
    
  describe "content's length" do
    context "when the length is 140 or less" do
      it "is valid" do
        @micropost.content = "a"*140
        expect(@micropost).to be_valid
      end
    end

    context "when the length is 141 or more" do
      it "is invaid" do
        @micropost.content = "a"*141
        @micropost.valid?
        expect(@micropost.errors[:content]).to include(I18n.t("activerecord.errors.models.micropost.attributes.content.too_long"))
      end
    end
  end
end
