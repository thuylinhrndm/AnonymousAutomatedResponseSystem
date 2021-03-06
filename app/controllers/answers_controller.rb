class AnswersController < ApplicationController
  before_action :check_current_user_is_signed_in
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  
  def my_answers
      @answers = Answer.where(user_id: current_user.id).order(created_at: :desc)
  end
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    if request.xhr?
    respond_to do |format|
      format.html
      format.js
    end
    end
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to posts_path, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: posts_path }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
   def check_current_user_is_signed_in
      unless current_user_signed_in?
        redirect_to root_url, notice: "Please sign in to do that"
      end
    end

    def current_user_signed_in?
        current_user ? true : false
    end

  
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

     def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
     end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:description, :user_id, :post_id)
    end
end
