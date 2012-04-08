class TeesController < ApplicationController
  make_resourceful do
    actions :all
    before :create do
        current_object.user = current_user if user_signed_in?
    end
    response_for :create do
        flash[:notice] = "Successfully created Tee!."
        redirect_to @tee
    end
        response_for :update do
        flash[:notice] = "Successfully updated Tee!."
        redirect_to @tee
    end
        response_for :destroy do
        flash[:notice] = "Successfully destroyed Tee!"
        redirect_to tees_url
    end
    end
 
end
