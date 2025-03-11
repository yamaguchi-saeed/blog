class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.all.order(created_at: :desc)
    @categories = Category.all
    
    respond_to do |format|
      format.html
      format.json { render json: @articles.to_json(include: [:user, :category, :tags]) }
    end
  end
  
  def show
    @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Article not found"
    redirect_to articles_path
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    
    if @article.save
      flash[:notice] = "記事が正常に作成されました。"
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] =  "記事が正常に更新されました。"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @article.destroy
    flash[:notice] ="記事が正常に削除されました。"
    redirect_to articles_path
  end
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :content, :category_id, tag_ids: [])
  end
  
  def require_same_user
    if current_user != @article.user
      flash[:alert] = "自分の記事のみ編集・削除できます"
      redirect_to @article
    end
  end
end
