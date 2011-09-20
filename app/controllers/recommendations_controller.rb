class RecommendationsController < ApplicationController
  layout "home"
  
  # GET /recommendations
  # GET /recommendations.xml
  def index
  end
  
  def search
    recommendations = {}
    search_conditions = ""
    
    unless params[:first_name].blank?
      unless search_conditions.blank?
        search_conditions = search_conditions + " and "
      end
      search_conditions = search_conditions + "first_name like :first_name"
      recommendations[:first_name] = params[:first_name] + "%"
    end
    unless params[:last_name].blank?
      unless search_conditions.blank?
        search_conditions = search_conditions + " and "
      end
      search_conditions = search_conditions + "last_name like :last_name"
      recommendations[:last_name] = params[:last_name] + "%"
    end
    unless params[:initials].blank?
      unless search_conditions.blank?
        search_conditions = search_conditions + " and "
      end
      search_conditions = search_conditions + "initials like :initials"
      recommendations[:initials] = params[:initials] + "%"
    end
    unless params[:dob].blank?
      unless search_conditions.blank?
        search_conditions = search_conditions + " and "
      end
      search_conditions = search_conditions + "dob = :dob"
      recommendations[:dob] = params[:dob]
    end
    unless params[:id_code].blank?
      unless search_conditions.blank?
        search_conditions = search_conditions + " and "
      end
      search_conditions = search_conditions + "id_code like :id_code"
      recommendations[:id_code] = params[:id_code] + "%"
    end
    unless params[:start_dt].blank? and params[:end_dt].blank?
      logger.debug "between got selected"
      unless search_conditions.blank?
        search_conditions = search_conditions + " and "
      end
      search_conditions = search_conditions + "end_dt between :start_dt and :end_dt"
      recommendations[:start_dt] = DateTime.parse(params[:start_dt])
      recommendations[:end_dt] = DateTime.parse(params[:end_dt])
    end
    
    @recommendations = Recommendation.find(:all, :conditions => [search_conditions, recommendations])
    
    render :partial => "search_result"
  end

  # GET /recommendations/1
  # GET /recommendations/1.xml
  def show
    @recommendation = Recommendation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recommendation }
    end
  end

  # GET /recommendations/new
  # GET /recommendations/new.xml
  def new
    @recommendation = Recommendation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recommendation }
    end
  end

  # GET /recommendations/1/edit
  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  # POST /recommendations
  # POST /recommendations.xml
  def create
    @recommendation = Recommendation.new(params[:recommendation])

    respond_to do |format|
      if @recommendation.save
        flash[:notice] = 'Recommendation was successfully created.'
        format.html { redirect_to(@recommendation) }
        format.xml  { render :xml => @recommendation, :status => :created, :location => @recommendation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recommendation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recommendations/1
  # PUT /recommendations/1.xml
  def update
    @recommendation = Recommendation.find(params[:id])

    respond_to do |format|
      if @recommendation.update_attributes(params[:recommendation])
        flash[:notice] = 'Recommendation was successfully updated.'
        format.html { redirect_to(@recommendation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recommendation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recommendations/1
  # DELETE /recommendations/1.xml
  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy

    respond_to do |format|
      format.html { redirect_to(recommendations_url) }
      format.xml  { head :ok }
    end
  end
  
  def show_search
  end
  
  def do_find
    @recommendation = Recommendation.find(:condition => ["initials = ? AND id_code = ?", params[:initials], params[:id_code]])
    
    respond_to do |format|
      format.html { redirect_to(@recommendation) }
    end
  end
end
