class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  def self.total_questions
    Question.count
  end
end
