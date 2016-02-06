class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Autoinc

  field :number, type: Integer
  increments :number
  field :text, type: String

  has_many :comments

  validates_presence_of :text

  before_destroy :check_for_children

  def check_for_children
    unless self.comments.nil? || self.comments.empty?
      self.errors[:base] << "Cannot delete topic while its children exists."
      return false
    end
  end
end
