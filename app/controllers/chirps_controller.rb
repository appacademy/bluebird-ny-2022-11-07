class ChirpsController < ApplicationController

  def index
    @chirps = Chirp.all 
    # debugger
    # render json: @chirps
    render :index
  end

  def show
    @chirp = Chirp.find(params[:id])
    # debugger
    render :show
  end

  def new
    render :new
  end

  def create 
    @chirp = Chirp.new(chirp_params)

    # chirp[body] = ""
    # chirp[title] = ""

    @chirp.author_id = current_user.id

    # debugger
    if @chirp.save
      redirect_to chirp_url(@chirp)
    else
      render json: @chirp.errors.full_messages, status: 422
    end
  end

  def update 
    @chirp = Chirp.find(params[:id])

    if @chirp.update(chirp_params)
      redirect_to chirp_url(@chirp)
    else 
      render json: @chirp.errors.full_messages, status: :unprocessable_entity 
    end
  end

  def destroy 
    @chirp = Chirp.find(params[:id])
    # @chirp = Chirp.find_by(id: 5)
    @chirp.destroy 
    redirect_to chirps_url
  end


  private 
  def chirp_params 
    params.require(:chirp).permit(:body)
  end

  
#   chirps GET    /chirps(.:format)     chirps#index
#   chirps     POST   /chirps(.:format)     chirps#create
#  chirp GET    /chirps/:id(.:format) chirps#show
#   chirp     PATCH  /chirps/:id(.:format) chirps#update
#    chirp    PUT    /chirps/:id(.:format) chirps#update
#    chirp    DELETE /chirps/:id(.:format) chirps#destroy
end
