class CommentsController < ApplicationController
    make_resourceful do
        actions :create, :destroy
        belongs_to :tee
  
        before :create do
        current_object.user = current_user if user_signed_in?
    end
        response_for :create do
        flash[:notice] = "Successfully created comment"
        redirect_to parent_object
    end
        response_for :create_fails do
        flash[:notice] = "Creating comment failed! please try again!"
        redirect_to parent_object
    end
        response_for :destroy do
        flash[:notice] = "Successfully delete comment"
       redirect_to parent_object
    end
        response_for :destroy_fails do
        flash[:notice] = "Deleting comment failed!"
        redirect_to parent_object
    end

   #response_for :create, :create_fails, :destroy, :destroy_fails do
   #redirect_to parent_object
   #end
    end

end

