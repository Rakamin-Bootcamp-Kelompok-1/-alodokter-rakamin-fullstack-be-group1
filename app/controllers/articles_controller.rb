class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :update, :destroy]

      # GET /articles
  def index
    @articles = Article.all

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  #GET /articles/search
  def search
    @articles = Article.where("article_title LIKE ?", "%" + params[:article_title] + "%").page(params[:page]).per(params[:per_page])
    render json: {
            data: @articles,
            meta:{
                page: params[:page],
 #               per_page: params[:per_page],
                next_page: @articles.next_page,
                prev_page: @articles.prev_page,
                total_page: @articles.total_pages
            }
        },status: :ok

        rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e
        }, status: :not_found
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
