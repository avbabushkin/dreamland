class DreamsController < ApplicationController
  
  def create
    current_user = User.find_by(id: session[:current_user_id])
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    
    if @dream.save
      redirect_to user_path @dream.user
      flash[:notice] = "Запись успешно создана"
    else
      flash[:notice] = "Запись не создана"
      redirect_to user_path @dream.user
    end
  end
  
  def destroy
    @dream = Dream.find(params[:id])
    user = @dream.user
    @dream.destroy

    flash[:notice] = "Запись удалена"
    redirect_to user_path(user), notice: 'Запись удалена'
  end

  private   

  def dream_params
    params.require(:dream).permit(:dream_title, :dream_text, :user_id)      
  end
end