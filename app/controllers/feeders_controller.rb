class FeedersController < ApplicationController
  before_action :set_feeder, only: [:show, :edit, :update, :destroy]

  # GET /feeders
  # GET /feeders.json
  def index

    @feeders = Feeder.paginate(:page => params[:page], per_page: 12).where(user_id: params[:user_id]).order(created_at: :desc)
    @quotes = ["A generous life is a fruitful life!", "Blessed are the ones who give", "A good deed a day makes your troubles go away!", "Feed the poor, Feed your soul!"] 
    @notes = ["Thank You!", "You're Awesome!", "Keep It Up!", "Bless You!"]

  end

  # GET /feeders/1
  # GET /feeders/1.json
  def show
    @feeding = Feeding.find(params[:feeding_id])
    gon.client_token = generate_client_token

  end

  # GET /feeders/new
  def new
    @feeding = Feeding.find(params[:feeding_id])

    @feeder = Feeder.new
  end

  # # GET /feeders/1/edit
  def edit
  end

  # # POST /feeders
  # # POST /feeders.json
  def create
    @feeding = Feeding.find(params[:feeding_id])
    @feeder = @feeding.feeders.create(user_id: current_user.id)

    if @feeding.price.nil? || @feeding.price == 0
      @feeder.update(paystatus: :authorized)
    end




    redirect_to feeding_feeder_path(@feeding, @feeder)

    # respond_to do |format|
    #   if @feeder.save
    #     format.html { redirect_to @feeder, notice: 'Feeder was successfully created.' }
    #     format.json { render :show, status: :created, location: @feeder }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @feeder.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /feeders/1
  # PATCH/PUT /feeders/1.json
  def update
    respond_to do |format|
      if @feeder.update(feeder_params)
        format.html { redirect_to @feeder, notice: 'Feeder was successfully updated.' }
        format.json { render :show, status: :ok, location: @feeder }
      else
        format.html { render :edit }
        format.json { render json: @feeder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeders/1
  # DELETE /feeders/1.json
  def destroy
    @feeder.destroy
    respond_to do |format|
      format.html { redirect_to feeders_url, notice: 'Feeder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feeder
      @feeder = Feeder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feeder_params
      params.require(:feeder).permit(:user_id, :feeding_id)
    end

    def generate_client_token
      Braintree::ClientToken.generate
    end
end
