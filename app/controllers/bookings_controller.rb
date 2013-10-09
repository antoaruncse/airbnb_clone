class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_property_id, only: [:new, :edit, :update, :destroy]
  before_action :check_dates, only: [:create,:edit,:update]

  
  def index
    if (!params[:property_id].blank?)
      @bookings = current_user.properties.find_by(params[:property_id]).bookings
    else
      @bookings = current_user.booking.all
      p @bookings
    end
  end

  
  def show
  end

  
  def new
     @booking=Booking.new

  end

 
  def edit
   @bookings =@property.bookings.find_by('id=?',params[:id])
  end

  
  def create
    @booking = Booking.new(booking_params)
    @property_histories=Booking.where("property_id=? and check_in_date=? and check_out_date=?",params[:property_id],@booking.check_in_date,@booking.check_out_date)
    if (@property_histories.blank?)
    #respond_to do |format|
      if @booking.save
        redirect_to user_bookings_path(current_user.id)
        #format.html { redirect_to 'index', notice: 'Booking was successfully created.' }
        #format.json { render action: 'index', status: :created, location: @booking }
      else
        flash[:error]="Problem while booking try again later"
     
         redirect_to root_path
      #  format.html { render action: 'new' }
       # format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    else
        
         flash[:error]="Property not avail on this dates"
        redirect_to root_path

    end
  end

  
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :no_content }
    end
  end

  private
    
    def set_property_id
      if(cookies[:property_id].blank?)
        cookies.permanent[:property_id]=params[:property_id]
      end
      @property=Property.find_by("id=?",cookies[:property_id])
    end

    def check_dates
     
     
    end

    def set_booking
      @booking = Property.find_by(params[:property_id]).bookings
    end

   
    def booking_params
      params.require(:booking).permit(:property_id, :user_id, :check_in_date, :check_out_date, :no_accomodates)
    end
end
