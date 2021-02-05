# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    # '.recent' is a class method that we defind in 'app/models/article.rb'
    # '.page' and '.per' come from kiminari gem
    articles = Article.recent.page(params[:page]).per(params[:per_page])
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  # Integrating AritcleSerailizer in our project
  # see article 'https://driggl.com/blog/a/from-activemodel-serializers-to-fast-jsonapi'
  def serializer
    ArticleSerializer
  end
end
