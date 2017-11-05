class DashBoardController < ApplicationController
  def show
    @num_of_users = User.total_users
    @num_of_questions = Question.total_questions
    @num_of_answers = Answer.total_answers
    @num_of_requests = Tenant.total_requests
  end
end
