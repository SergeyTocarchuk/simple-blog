class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", 
                              except: [:index, :show]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
  

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.now[:success] = "Article successfully created"
      redirect_to @article
    else
      flash.now[:error] = "Something went wrong"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
      flash.now[:success] = "Article successfully created"
    else
      flash.now[:error] = "Something went wrong"
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy      
    flash.now[:success] = 'Object was successfully deleted.'
    
    redirect_to root_path
  end
  

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
  
end
