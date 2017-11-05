class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  def self.total_users
    User.count
  end

  def self.user_questions_answers(user_id)
    usr = User.includes(:questions, :answers)
              .where('questions.private = ? and users.id = ?', false, user_id)
              .references(:questions).first
    output = {}
    usr.questions.each do |quest|
      arr = {}
      arr[:question_id] = quest.id
      arr[:title] = quest.title
      arr[:questioner_name] = User.where(id: quest.user_id).first.name
      quest.answers.each do |ans|
        if usr.id != ans.user_id
          hsh = {}
          hsh[:answers] = {}
          hsh[:answers][:body] = ans.body
          hsh[:answers][:answerer_name] = User.where(id: ans.user_id).first.name
          arr.merge!(hsh)
        else
          next
        end
      end
      output[:questions] = arr
    end
    output
  end
end
