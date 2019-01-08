class UsersController < ApplicationController
  @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
  # @wiki = current_user.wikis.new(wiki_params)

end
