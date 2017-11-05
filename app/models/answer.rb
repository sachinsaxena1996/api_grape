class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  def self.total_answers
    Answer.count
  end
end
