class QuestionsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
  
    def index
        @questions = Question.all.order('id')
    end

    def new
        @question = Question.new
    end

    def create
        # params.require(:question).permit(:title, :body) => tells rails to allow an object on the params that is called question. And on that question object allow the keys :title and :body
        @question = Question.new(params.require(:question).permit(:title, :body))
        #tell active record to goahead and run the INSERT SQL query against our db. Returns true if it saves, returns false if it doesn't save
        if @question.save
          redirect_to questions_path
        else
          redirect_to new_question_path
        end
    end

    def show
        id = params[:id]
        @question = Question.find(id)
        # For the form_with helper 
        @answer = Answer.new 
        # For the list of answer
        @answers = @question.answers.order(created_at: :desc)
    end

    def destroy
        id = params[:id]
        @question = Question.find(id)
        @question.destroy
        redirect_to questions_path
    end

    def edit
        id = params[:id]
        @question = Question.find(id)
        
    end

    def update
        id = params[:id]
        @question = Question.find(id)
        if @question.update(params.require(:question).permit(:title, :body))
          redirect_to question_path(@question)
        else
          render :edit
        end
    end
end
