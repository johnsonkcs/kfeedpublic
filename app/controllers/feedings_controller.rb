class FeedingsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_feeding, only: [:show, :edit, :update, :destroy]

  # GET /feedings
  # GET /feedings.json
  def index
    if params[:user_id]
    @feedings = Feeding.paginate(:page => params[:page], per_page: 5).where(user_id: params[:user_id])
    else
    @feedings = Feeding.all.paginate(:page => params[:page], per_page: 5).order(created_at: :desc)
    end
    @hash = Gmaps4rails.build_markers(@feedings) do |feeding, marker|
      marker.lat feeding.latitude
      marker.lng feeding.longitude
      marker.infowindow feeding.name
    end
  end

  # GET /feedings/1
  # GET /feedings/1.json
  def show
    
    @feeding_feeders = @feeding.feeders.where(paystatus: :authorized).order(created_at: :desc)
    
    @hash = Gmaps4rails.build_markers(@feeding) do |f, marker|
      marker.lat f.latitude
      marker.lng f.longitude
      marker.infowindow f.name
    end
  end

  # GET /feedings/new
  def new
    @feeding = Feeding.new
  end

  # GET /feedings/1/edit
  def edit
  end

  # POST /feedings
  # POST /feedings.json
  def create
    @user = current_user
    @feeding = @user.feedings.new(feeding_params)
    @mailing_list = User.all

    respond_to do |format|
      if @feeding.save

        @mailing_list.each do |subscriber|
        FeedingsMailer.notification_email(subscriber, @feeding).deliver_later
        end 
        format.html { redirect_to @feeding, notice: 'Feeding was successfully created.' }
        format.json { render :show, status: :created, location: @feeding }
      else
        format.html { render :new }
        format.json { render json: @feeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedings/1
  # PATCH/PUT /feedings/1.json
  def update
    respond_to do |format|
      if @feeding.update(feeding_params)
        format.html { redirect_to @feeding, notice: 'Feeding was successfully updated.' }
        format.json { render :show, status: :ok, location: @feeding }
      else
        format.html { render :edit }
        format.json { render json: @feeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedings/1
  # DELETE /feedings/1.json
  def destroy
    @feeding.destroy
    respond_to do |format|
      format.html { redirect_to feedings_url, notice: 'Feeding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feeding
      @feeding = Feeding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feeding_params
      params.require(:feeding).permit(:user_id, :date, :time, :place, :latitude, :longitude, :price, :pax_limit, :name, { :feeding_pics => [] })
    end
end
