class Topic < ApplicationRecord
  has_many :votes, dependent: :destroy

  def upvote
    self.votes.create
  end

  def downvote
    if self.votes.where(:topic_id => self.id).any?
      self.votes.first.destroy
    else
      false
    end
  end
end
