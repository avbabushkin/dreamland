class DreamsController < ApplicationController
  before_action :load_dream, except: [:new, :create]
  before_action :authorize_user, except: [:new, :create, :show]

  def new
    if !current_user.nil? 
      @dream = Dream.new
      @user = current_user if current_user
      @dream.user = @user
    else
      redirect_to root_url, warning: "Please Login"
    end
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user if current_user
    
    if @dream.save
      redirect_to @dream.user, success: "Success"
    else
      redirect_to @dream.user, warning: "Fail"
    end
  end

  def show        
  end

  def edit
  end

  def update
    if @dream.update(dream_params)
      redirect_to dream_path(@dream), info: 'Update success'
    else
      render :edit    
    end
  end
  
  def destroy
    user = @dream.user
    @dream.destroy
    redirect_to user_path(user), success: 'Dreams has been delete'
  end

  private   

  def load_dream
    # user = current_user if current_user
    @dream = Dream.find(params[:id])
  end

  def authorize_user
    reject_user unless @dream.user == current_user
  end

  def dream_params
    params.require(:dream).permit(:content, :link, :user_id)      
  end

end