class ArticlesController < ApplicationController
  # semua function yang ada di dalem class ini bakal ngejalanin ini dulu baru code setelahnya
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # gbs lgsg masukin params[:article] di dlm new() nya
    # require top level key dr article, trs permit title & description buat bikin object baru
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was created succesfully."
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity # bisa juga tulis status: 422
    end
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully!"
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  # anything below it, is a private method, gaperlu tulis end soalnya bkn block of code
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end