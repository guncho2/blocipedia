class CollaboratorsController < ApplicationController


  def new
      @collaborator = Collaborator.new
    end
    
  def create
    @wiki = Wiki.find(params[:wiki_id])
    current_collaborators = @wiki.users
    @user = User.find_by(email: params[:collaborator][:user]) ##now @user is  collaborator
    ##associated to user through wiki

    if User.exists?(@user) ##@user who is collaborator
      if current_collaborators.include?(@user) || @user == current_user ##curr collaborator
        ##that has a wiki created by users and collaborator or user is the user
        flash[:error] = "User is already a collaborator."
        redirect_to @wiki
      else
        @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @user.id)
        ##if not @collaborator will be created with the associated wiki with the user who created the wiki
        if @collaborator.save
          flash[:notice] = "Collaborator has been added!"
        else
          flash[:error] = "Error adding collaborator, please try again."
        end
        redirect_to @wiki
      end
    else
      flash[:error] = "Sorry, no such user exists. "
      redirect_to @wiki
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator has been successfully removed. "
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error removing this collaborator."
      redirect_to @wiki
    end
  end

end
