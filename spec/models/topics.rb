require 'rails_helper'

RSpec.describe Topic, :type => :model do
  before (:all) do
    Topic.all.each {|t| t.destroy }
    @topic = FactoryGirl.create(:topic)
  end

  context "when object has mandatory attributes" do
    it "valid" do
      @topic.text = Faker::Lorem.words(5).join(' ')
      expect(@topic.valid?).to be(true)
    end
  end

  context "when object does not have mandatory attributes" do
    it "invalid" do
      @topic.text = nil
      expect(@topic.valid?).not_to be(true)
    end
  end

  describe ".check_for_children" do
    context "do not destroy if has children (comments)" do
      it do
        FactoryGirl.create(:comment, :topic => @topic)
        expect(@topic.destroy).to be(false)
      end
    end
  end

end