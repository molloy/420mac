class VerificationController < ApplicationController
  def index
    render :layout => 'home'
  end

  def show
  end

  def search
    @verification = Recommendation.first(:conditions => ["initials = ? AND id_code = ?", params[:initials], params[:id_code]])
    
    if @verification == nil
      flash[:notice] = 'The initials and last 4 digits of ID does not match any existing records.'
      redirect_to(:action => 'index', :layout => 'home')
    else
      render :layout => 'home'
    end
#    redirect_to :action => 'show'
  end
end
