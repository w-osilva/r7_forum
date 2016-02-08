require 'rails_helper'

RSpec.describe Comment, :type => :model do
  before (:all) do
    Comment.all.each {|t| t.destroy }
    @topic = FactoryGirl.create(:topic)
    @comment = FactoryGirl.create(:comment, :topic => @topic)
  end

  context "when object has mandatory attributes" do
    it "valid" do
      @comment.text = Faker::Lorem.words(5).join(' ')
      expect(@comment.valid?).to be(true)
    end
  end

  context "when object does not have mandatory attributes" do
    it "invalid" do
      @comment.text = nil
      expect(@comment.valid?).not_to be(true)
    end
  end

  describe ".check_for_children" do
    context "do not destroy if has children (comments)" do
      it do
        FactoryGirl.create(:comment, comment: @comment )
        expect(@comment.destroy).to be(false)
      end
    end
  end

end