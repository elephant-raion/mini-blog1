require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost) { create(:micropost)}

  it "is valid with a content, and  user id" do
    expect(micropost).to be_valid
  end

  it "is invalid without a user id" do
    micropost.user_id = nil
    expect(micropost).to be_invalid
    expect(micropost.errors).to be_of_kind(:user_id, :blank)
  end
  
  it "is invalid without a content" do
    micropost.content = nil
    expect(micropost).to be_invalid
    expect(micropost.errors).to be_of_kind(:content, :blank)
  end
    
  describe "content's length" do
    context "when the length is 140 or less" do
      it "is valid" do
        micropost.content = "a"*140
        expect(micropost).to be_valid
      end
    end

    context "when the length is 141 or more" do
      it "is invaid" do
        micropost.content = "a"*141
        expect(micropost).to be_invalid
        expect(micropost.errors).to be_of_kind(:content, :too_long)
      end
    end
  end
end
