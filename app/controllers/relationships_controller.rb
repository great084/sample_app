class RelationshipsController < ApplicationController

    def create
        @user = User.find(params[:relationship][:followed_id])
        current_user.follow!(@user)
        redirect_to @user
        #redirect_to users_url
    end
    
    def destroy
        @user = Relationship.find(params[:id]).followed
        current_user.unfollow!(@user)
        redirect_to @user
    end
end