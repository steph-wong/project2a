class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new(:product_id => params[:id])
  end

  def create
    # @product = Products.find(params[:product_id])
    # @review = @product.reviews.build(permitted_review_params)
    # current_user.reviews << @review
    # @review.save

    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(permitted_review_params)
    @review.user = current_user
    @review.save

      if @review.save
        flash[:success] = "Review posted."
        redirect_to products_url
      else
        flash[:danger] = "Review error."
        redirect_to products_url
      end
    end

  def destroy
  end

  private

    def permitted_review_params
      params.require(:review).permit(:content)
    end

end
