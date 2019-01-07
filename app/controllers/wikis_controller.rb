class WikisController < ApplicationController
  def edit

    @wiki = Wiki.find(params[:id])

  end

  def new
@user = User.find_by(id: session[:user_id])
    @wikis = Wiki.new


  end

  def show

    @wikis = Wiki.find(params[:id])

  end

  def index
        @user = User.find_by(id: session[:user_id])
  	    @wikis = Wiki.all
  	  end

  def create
	    @wiki = Wiki.new
      @wiki = Wiki.new(params[:id])
      @wiki.assign_attributes(wiki_params)
	    # @wiki.title = params[:wiki][:title]
	    # @wiki.body = params[:wiki][:body]


	    if @wiki.save
	      flash[:notice] = "Wiki was saved."
	      redirect_to @wiki
	    else
	      flash.now[:alert]= "There was an error saving the wiki. Please try again."
	      render :new
	    end
	  end


    def destroy
	     @wiki = Wiki.find(params[:id])

	     if @wiki.destroy
	       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
	       redirect_to wiki_new_path
	     else
	       flash.now[:alert] = "There was an error deleting the post."
	       render :show
	     end
	   end

     def update
    	    @wiki = Wiki.find(params[:id])
    	    @wiki.title = params[:wiki][:title]
    	    @wiki.body = params[:wiki][:body]

    	    if @wiki.save
    	      flash[:notice] = "Wiki was updated."
    	      redirect_to @wiki
    	    else
    	      flash.now[:alert] = "There was an error saving the wiki. Please try again."
    	      render :edit
    	    end
    	  end

        private

          def wiki_params
            params.require(:wiki).permit(:title, :body, :private)
          end


end
