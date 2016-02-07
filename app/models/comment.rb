require 'autoinc'
class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Autoinc

  field :number, type: Integer
  increments :number
  field :text, type: String
  field :topic_id, type: String
  field :comment_id, type: String

  belongs_to :topic, class_name: "Topic"
  belongs_to :comment, class_name: "Comment"
  has_many :comments, class_name: "Comment", foreign_key: "comment_id"

  validates_presence_of :text

  before_destroy :check_for_children

  PER_PAGE = 2

  def is_first_level?
    self.comment.nil?
  end

  def get_topic
    self.is_first_level? ? self.topic : self.comment.get_topic
  end

  private
  def check_for_children
    unless self.comments.nil? || self.comments.empty?
      self.errors[:base] << "Cannot delete comment while its children exists."
      return false
    end
  end

end
