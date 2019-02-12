class DreamsController < ApplicationController
  def create
    # user = User.find(params[:id])
    @dream = Dream.new(dream_params)
    # user.dreams.create(dream_params)
    user = User.find_by(id: 2)
    @dream.user_id = 2 
    @dream.save

    redirect_to user_path(user)
  end

  def destroy
    @dream = Dream.find(params[:id])
    user = @dream.user
    @dream.destroy

    redirect_to user_path(user)
  end

  private

  def dream_params
    params.require(:dream).permit(:dream_title, :dream_text)      
  end
end
