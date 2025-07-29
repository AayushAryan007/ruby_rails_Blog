class ArticlesController < ApplicationController

  def index
    @articles=Article.all
  end


  def show
    @articles=Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
     
    end
end
    # says:
# “I expect the data to be nested under a key named article.”

#  .permit(:title, :body)
# This is the strong parameters part.

# It only allows :title and :body to be extracted.

# Any other fields (e.g., :is_admin) will be ignored and rejected.

# This protects against users injecting unwanted fields.
   
    # strong parameters
  
