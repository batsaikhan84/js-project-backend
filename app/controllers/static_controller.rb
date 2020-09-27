class StaticController < ApplicationController
    def home
        render json: { status: 'WORKING' }
    end
end
