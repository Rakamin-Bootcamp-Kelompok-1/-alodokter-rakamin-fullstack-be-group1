class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :update, :destroy]

      # GET /articles
  def index
    @articles = Article.page(params[:page])

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  #GET /articles/category
  def findby_category

    @articles = Article.where("article_category = ?", params[:article_category])

        render :json => @articles,
        status: :ok

        rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e
        }, status: :not_found

  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:article_category, :article_title, :content_desc, :image_url, :main_article)
    end
end
