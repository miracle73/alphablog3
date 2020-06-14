class ArticlesController < ApplicationController
before_action :set_article, only: [:show,:update,:destroy,:edit]
before_action :require_user, except: [:index,:show]
before_action :require_same_user, only: [:edit,:update]
before_action :require_same_user2, only: [:destroy]
ARTICLES_PER_PAGE = 5
def index
@page = params.fetch(:page,0).to_i
@articles = Article.offset(@page * ARTICLES_PER_PAGE).limit(ARTICLES_PER_PAGE)
end

def new
@article = Article.new

end
def edit

end

def create

@article = Article.new(article_params)
@article.user = current_user
 if @article.save
flash[:notice] = "Article was sucessfully created"
redirect_to article_path(@article)
else
render :new
end
end
def update


if @article.update(article_params)
flash[:notice] = "Article was sucessfully updated"
redirect_to article_path(@article)
else 
render :edit
end
end

def show

end
 def destroy

 @article.destroy
 flash[:notice] = "Article was sucessfully deleted"
 redirect_to articles_path
 end
 
 
private
def set_article
@article = Article.find(params[:id])
end

def article_params
params.require(:article).permit(:title,:description, category_ids: [])
end

def require_same_user
if current_user != @article.user && !current_user.admin?
flash[:alert] = "you can only edit your own article"
redirect_to articles_path
end
end
def require_same_user2
if current_user != @article.user && !current_user.admin?
flash[:alert] = "you can only delete your own article"
redirect_to articles_path
end
end
end