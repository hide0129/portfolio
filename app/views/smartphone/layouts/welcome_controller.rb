class WelcomeController < ApplicationController
  before_action :set_categories

  def index
    @articles = Article.published
  end

  def aff
    @articles = Article.published
    @services = Service.where(price_plan: 0).order(score: :desc)
    if request.from_pc?
      @from_pc = true
    else
      @from_pc = false
    end
  end

  def search_services
    @services = Service.search(welcome_params).order(score: :desc)
  end

  def age_check
  end

  private
  def set_categories
    @categories = Category.all
  end

  def welcome_params
    params.permit(:membership, :operation_life, :genre, :age_group, :price_plan)
  end
end
