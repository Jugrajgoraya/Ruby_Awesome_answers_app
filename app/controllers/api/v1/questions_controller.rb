class Api::V1::QuestionsController < ApplicationController
    def index
        questions = Question.order(created_at: :desc)
        render json: questions
      end
    
      def show
        # /api/v1/questions/:id
        question = Question.find params[:id]
        render json: question
      end
end
