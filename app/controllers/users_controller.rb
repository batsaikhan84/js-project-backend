class UsersController < ApplicationController
    @@selected_user = []
    def index
        users = User.all
        render json: UserSerializer.new(users).to_serialized_json
    end
    def show
        user = User.find_by(id: params[:id])
        if user
            render json: UserSerializer.new(user).to_serialized_json
        else
            render json: { message: 'User not found'}
        end
    end
    def select
        user = User.find(params[:user][:id])
        if user
            @@selected_user.clear
            @@selected_user << user
            render json: UserSerializer.new(user).to_serialized_json
        else
            render json: { message: 'user clear' }
        end
    end
    def clear
        @@selected_user.clear
        render json: { message: 'user clear' }
    end
    def selected_user
        if !@@selected_user.empty?
            render json: UserSerializer.new(@@selected_user[0]).to_serialized_json
        else 
            render json: { message: 'user clear'}
        end
    end
end
