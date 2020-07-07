class ReviewsController < ApplicationController
    before_action :current_user, :redirect_user, :review, only: [:show, :edit, :update, :destroy]
    def new
        @review = Review.new
    end

    def create  
        @review = Review.create(review_params)
        redirect_to @review
    end

    def show 
    end

    def edit
    end

    def update 
        @review.update(content: params[:review][:content])
        redirect_to @review
    end

    def destroy 
        @review.destroy
        redirect_to new_review_path, success: "#{@review.content} was deleted."
    end

    private
    def review
        @review = Review.find(params[:id])
    end
    def review_params
        params.require(:review).permit(:content, :book_id, :user_id)
    end
end
