class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  
  def index
    @properties = current_user.properties
  end

  
  def show

  end

 def search
  cookies.delete(:check_in_date)
  cookies.delete(:check_out_date)
    if params[:city].blank?
      flash[:error]="Invalid place"
      redirect_to 'root_path'
    else 
      if current_user
        if params[:check_in_date].blank? or params[:check_out_date].blank?
          @properties = Property.search_city(params[:city],current_user.id)
        else 
          @scope_prop = Property.search_city(params[:city],current_user.id)
          @property_histories=Booking.booked_property(params[:check_in_date],params[:check_out_date])

          if  !( @property_histories.select(:property_id).map(&:property_id).blank?) 
            @properties= @scope_prop.where("id != ?", @property_histories.select(:property_id).map(&:property_id).first)
          else
            @properties=@scope_prop
          end
          cookies.permanent[:check_in_date]=params[:check_in_date]
          cookies.permanent[:check_out_date]=params[:check_out_date]
        end
      else
        @properties = Property.where("city=?",params[:city])
      end
   
    end 
  end

  
  def new
    @property = Property.new
  end

  
  def edit
  end

  
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to user_properties_path(current_user.id), notice: 'Property was successfully created.' }
        format.json { render action: 'show', status: :created, location: @property }
      else
        format.html { render action: 'new' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to user_properties_path(current_user.id), notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  private
    
    def set_property
      @property = Property.find(params[:id])
    end

    
    def property_params
      params.require(:property).permit(:user_id, :home_type, :room_type, :accomodates, :city, :address, :price_night, :title)
    end
end
