class ApplicationsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @application = current_user.applications.build(application_params)
    if @application.save
      flash[:success] = "Application created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @application.destroy
    flash[:success] = "Application deleted"
    redirect_to request.referrer || root_url
  end

  private

    def application_params
      params.require(:application).permit(:description, :APIkey)
    end
    
    def correct_user
      @application = current_user.applications.find_by(id: params[:id])
      redirect_to root_url if @application.nil?
    end
end
