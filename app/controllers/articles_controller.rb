class ArticlesController < ApplicationController

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: { article: ArticleSerializer.new(@article) }, status: :created
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find_by(slug: params[:slug])
    render json: { article: ArticleSerializer.new(@article) }, status: :ok
  end

  def update
    @article = Article.find_by(slug: params[:slug])
    if @article.update(article_params)
      render json: { article: ArticleSerializer.new(@article) }, status: :ok
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find_by(slug: params[:slug])
    @article.destroy
    head :no_content
  end

    private
  def article_params
    params.require(:article).permit(:title, :description, :body)
  end
end
