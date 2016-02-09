require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  before (:all) do
    #DatabaseCleaner.clean_with(:deletion) #Don't work with Mongoid

    Topic.all.each {|t| t.destroy}
    Comment.all.each {|t| t.destroy}

    # objects of test
    @topic = FactoryGirl.create(:topic)
    @comment = FactoryGirl.create(:comment, topic: @topic)
  end

  describe ".index" do
    context "when the request calls the method" do
      subject(:request_to_index) {  get :index }

      it "renders the index template" do
        request_to_index
        expect(response).to render_template("index")
      end

      it "include @topic in @topics" do
        request_to_index
        expect(assigns(:topics_old)).to include @topic
      end

      it "have at most #{Topic::PER_PAGE} @topics (because pagination)" do
        request_to_index
        expect(assigns(:topics_old)).to have_at_most(Topic::PER_PAGE).items
      end
    end
  end

  describe ".show" do
    context "when the request calls the method" do
      subject(:request_to_show) {  get :show, { id: @topic.id} }

      it "renders the show template" do
        request_to_show
        expect(response).to render_template("show")
      end

      it "@topic the response must be equal to test @topic" do
        request_to_show
        expect(assigns(:topic)).to eq @topic
      end

      describe "comments of the topic" do
        it "@topic the response should include @comment test" do
          request_to_show
          expect(assigns(:topic).comments).to include @comment
        end

        it "have at most #{Comment::PER_PAGE} @comments (because pagination)" do
          request_to_show
          expect(assigns(:comments)).to have_at_most(Comment::PER_PAGE).items
        end
      end

    end
  end

  describe ".create" do
    context "when the request calls the method" do
      subject(:new_topic){ @new_topic = FactoryGirl.build(:topic) }
      subject(:request_to_create) { post :create, { topic: { text: @new_topic.text, _id: @new_topic._id }} }

      it "create and redirect" do
        new_topic
        request_to_create
        expect(response).to redirect_to("/topics/#{@new_topic._id}")
      end
    end
  end

end