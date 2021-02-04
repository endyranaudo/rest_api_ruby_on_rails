class ArticlesController < ApplicationController
  
  def index
    # '.recent' is a class method that we define 
    articles = Article.recent
    render json: articles
  end


  def show
    article = Article.find(params[:id])
    # render json: article
  end

  # Integrating AritcleSerailizer in our project 
  # see article 'https://driggl.com/blog/a/from-activemodel-serializers-to-fast-jsonapi'
  def serializer
    ArticleSerializer
  end

end