require 'autoinc'
class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Autoinc

  field :number, type: Integer
  increments :number

  field :text, type: String
  field :type, type: Integer
  field :topic_id, type: Integer

  validates_presence_of :text

  has_many :comments, class_name: "Post", foreign_key: "topic_id"
  belongs_to :topic, class_name: "Post"

  TOPIC = 1
  COMMENT = 2

  before_save :set_type
  before_destroy :check_for_comments

  def set_type
    self.type = self.topic.nil? ? TOPIC : COMMENT
  end

  def get_type_name
    self.type == TOPIC ? 'Topic' : 'Comment'
  end

  def get_root_topic
    self.topic.nil? ? Post.find(self.id) : (Post.find(self.topic.id)).get_root_topic
  end

  def check_for_comments
    unless self.comments.nil? || self.comments.empty?
      self.errors[:base] << "Cannot delete post while its comments exists."
      return false
    end
  end

end

