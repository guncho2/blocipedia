class WikiPolicy < ApplicationPolicy


  class Scope
       attr_reader :user, :scope

       def initialize(user, scope)
         @user = user
         @scope = scope
       end

       def resolve
         wikis = []
         if user.role == 'admin'
           wikis = scope.all # if the user is an admin, show them all the wikis
         elsif user.role == 'premium'
           all_wikis = scope.all
           all_wikis.each do |wiki|
             if wiki.private == true || wiki.user_id == user || wiki.collaborators.include?(user)
               wikis << wiki # if the user is premium, only show them private == false wikis, or that private wikis they created, or private wikis they are a collaborator on
             end
           end
         else # this is the lowly standard user
           all_wikis = scope.all
           wikis = []
           all_wikis.each do |wiki|
             if wiki.private == true || wiki.collaborators.include?(user)
               wikis << wiki # only show standard users private == false wikis and private wikis they are a collaborator on
             end
           end
         end
         wikis # return the wikis array we've built up
       end
     end

  def update?
    user.present?
  end

  def create?
    user.present?
  end

  def delete?
    user_is_owner?
  end

  def user_is_owner?
    if user.id == record.user_id
      return true
    else
      return false
    end
  end

end
