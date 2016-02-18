class SessionsController < ApplicationController
  def new
    @user = User.new
    @task = Task.new
    if current_user != nil
      #@tasks = Task.where(owner: current_user.email).find_each
      
      @tasks = Task.where("owner = ? or collaborator1 = ? or collaborator2 = ? or collaborator3 = ?", current_user.email, current_user.email, current_user.email, current_user.email).find_each
      
    else
      @tasks = nil
    end
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    if user != nil
      if user.password == params[:password]
        log_in user
        @tasks = Task.where(owner: current_user.email).find_each
        redirect_to '/'
      else
        flash.now[:danger] = 'Invalid email/password combination'
        flash.keep(:danger)
        redirect_to '/'
      end
    else
      flash.now[:danger] = 'Invalid email address'
      flash.keep(:danger)
      redirect_to '/'
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
