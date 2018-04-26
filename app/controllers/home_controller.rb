class HomeController < ApplicationController
  def index
    @sliders = Article.where(highlight: true).limit(4)
    @articles = Article.paginate(page: params[:page], per_page: 3)
                        .order(created_at: :desc)
  end
end
