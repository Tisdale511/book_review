class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    def create 
        @review = Review.create(review_params)
        redirect_to @review
    end

    def show 
        @review = Review.find(params[:id])
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update 
        @review.update(content: params[:review][:content])
        redirect_to @review
    end

    def destroy 
        @review = Review.find(params[:id]).destroy
        redirect_to new_review_path, success: "#{@review.content} was deleted."
    end

    private
    def review_params
        params.require(:review).permit(:content, :book_id)
    end
end
