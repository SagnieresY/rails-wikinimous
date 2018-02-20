class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new
  end

  def new
    @article = Article.new(article_params)
    @article.save

    redirect_to articles_path
  end

  def edit
    set_article
  end

  def show
    set_article
  end

  def update
    set_article
    @article.update(article_params)
  end

  def destroy
    set_article
    @article.destroy

    redirect_to articles.path
  end

  private

  def set_article
    @article = Article.find(params[:id])

  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
