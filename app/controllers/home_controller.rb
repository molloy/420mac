class HomeController < ApplicationController
  def index
  end
  
  def welcome
    respond_to do |format|
      format.js
    end
  end

  def appointment
    respond_to do |format|
      format.js
    end
  end

  def facts
    respond_to do |format|
      format.js
    end
  end

  def faq
    respond_to do |format|
      format.js
    end
  end

  def contact
    respond_to do |format|
      format.js
    end
  end

  def verify
    @verification = Recommendation.first(:conditions => ["initials = ? AND id_code = ?", params[:initials], params[:id_code]])
    
    if @verification == nil
      flash[:error] = 'The initials and last 4 digits of ID does not match any existing records.'
      render :partial => 'verify'
    else
      render :partial => 'verified'
    end
  end
  
  def reset
    render :partial => 'verify'
  end

protected
  def authorize
  end
  
end
