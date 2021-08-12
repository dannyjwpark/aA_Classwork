class CommentsController < ApplicationController

    def index
        user_id = params[:user_id]
        artwork_id = params[:artwork_id]
        
        comments = Comment.find_by_sql(
        WHERE comments.user_id = user_id OR comments.artwork_id = artwork_id
        )

        render json: Comment.all
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: unprocessable_entity 
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment.destroy
            render json: comment
        else
            render json: comment.errors.full_messages, status: unprocessable_entity
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id)
    end

end