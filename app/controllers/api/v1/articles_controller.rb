class Api::V1::ArticlesController < ApplicationController
   before_action :find_article, only: [:show, :update, :destroy]

    def index 
        @articles = Article.all
        render json: @articles
    end

    def create
        @article = Article.create(article_params)
        if @article
            render json: @article, status: 200
        else
            render json: @article.errors, status: 500
        end
    end

    def show
        render json: @article
    end

    def update
        if @article.update(article_params)
            render json: @article, status: 200
        else
            render json: @article.errors, status: 500
        end
    end

    def destroy
        @article.destroy
        render json:  @article
    end

    private
        def find_article
            @article = Article.find(params[:id])
        end
      def article_params
        params.require(:article).permit(:title, :body, :release_date)
      end
end
