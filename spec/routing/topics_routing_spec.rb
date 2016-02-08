require "rails_helper"

RSpec.describe TopicsController, :type => :routing do
  describe "routing" do

    let!(:resource) { 'topics' }

    context "to index" do
      it { expect(:get => "/#{resource}").to route_to("#{resource}#index") }
    end

    context "to new" do
      it { expect(:get => "/#{resource}/new").to route_to("#{resource}#new") }
    end

    context "to show" do
      it { expect(:get => "/#{resource}/1").to route_to("#{resource}#show", :id => "1") }
    end

    context "to edit" do
      it { expect(:get => "/#{resource}/1/edit").to route_to("#{resource}#edit", :id => "1") }
    end

    context "to create" do
      it { expect(:post => "/#{resource}").to route_to("#{resource}#create") }
    end

    context "to update" do
      it { expect(:put => "/#{resource}/1").to route_to("#{resource}#update", :id => "1") }
    end

    context "to destroy" do
      it { expect(:delete => "/#{resource}/1").to route_to("#{resource}#destroy", :id => "1") }
    end

    describe "nested routing to comments" do
      subject(:resource_comments) { "comments" }

      context "to index" do
        it { expect(:get => "/#{resource}/1/#{resource_comments}").to route_to("#{resource_comments}#index", :topic_id => "1") }
      end

      context "to new" do
        it { expect(:get => "/#{resource}/1/#{resource_comments}/new").to route_to("#{resource_comments}#new", :topic_id => "1") }
      end

      context "to show" do
        it { expect(:get => "/#{resource}/1/#{resource_comments}/1").to route_to("#{resource_comments}#show", :topic_id => "1", :id => "1") }
      end

      context "to edit" do
        it { expect(:get => "/#{resource}/1/#{resource_comments}/1/edit").to route_to("#{resource_comments}#edit", :topic_id => "1", :id => "1") }
      end

      context "to create" do
        it { expect(:post => "/#{resource}/1/#{resource_comments}").to route_to("#{resource_comments}#create", :topic_id => "1") }
      end

      context "to update" do
        it { expect(:put => "/#{resource}/1/#{resource_comments}/1").to route_to("#{resource_comments}#update", :topic_id => "1", :id => "1") }
      end

      context "to destroy" do
        it { expect(:delete => "/#{resource}/1/#{resource_comments}/1").to route_to("#{resource_comments}#destroy", :topic_id => "1", :id => "1") }
      end

      describe "nested routing to comments" do
        context "to new" do
          it { expect(:get => "/#{resource}/1/#{resource_comments}/1/#{resource_comments}/new").to route_to("#{resource_comments}#new", :topic_id => "1", :comment_id => "1" ) }
        end
      end
    end

  end
end
