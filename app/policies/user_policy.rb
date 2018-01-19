class UserPolicy < ApplicationPolicy
 #index --- allow access only for admin
 #show ---you see your own, admin sees all, other users don't see your profile
 #update --- allows admin to make updates only
 #destroy/delete --- you can't delete yourself, only admin can delete Others

 attr_reader :user, :record

 def initialize(user, record)
   @user = user
   @record = record
 end

 def index?
   user.admin?
 end

 def show?
   user.admin? || record == user
 end

 def update?
   user.admin?
 end

 def destroy?
   user.admin? && record != user
 end

end
