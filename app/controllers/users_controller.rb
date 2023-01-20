class UsersController < ApplicationController
    def index
        @users = User.search(params[:search])
    end

    def show
        @user = User.find(params[:id])
    end

    def self.search(search)
        if search
            invitee = User.find_by(email: search)
            if invitee
                invitee
            end
        end
        nil
    end
end
