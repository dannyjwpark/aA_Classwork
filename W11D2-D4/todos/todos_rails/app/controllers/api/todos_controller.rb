class Api::TodosController < ApplicationController
    def show
        render json: Todo.find(params[:id])
    end

    def index
        render json: Todo.all
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            render json: @todo
        else
            render json: @todo.errors.full_messages, status: 422
        end
    end

    def update
        @todo = Todo.find_by_id(id: params[:id])
        if @todo
            render json: @todo
        else
            render json: @todo.errors.full_messages, status: 422
        end
    end

    def destroy
        @todo = Todo.find_by_id(id: params[:id])
        if @todo && @todo.destroy
            render json: Todo.all
        else
            render json: @todo.errors.full_messages, status: 422
        end
    end

    def todo_params
        params(:todos).permit(:title, :body, :done)
    end
end