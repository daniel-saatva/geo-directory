class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.includes(:location)
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def people
    @people_json = {
      'type': 'FeatureCollection',
      'features': []
    }
    users = User.includes(:location, :tags, :squad)
    @people_json['features'] = users.map do |u|
      {
        'type': 'Feature',
        'properties': {
          'name': "#{u.firstname} #{u.lastname}",
          'country_name': u.location.country,
          'country_iso': u.location.country,
          'city_name': u.location.city,
          'email': u.email,
          'phone': u.phone,
          'start_date': u.start_date,
          'birth_date': u.birth_date,
          'squad': u.squad&.name,
          'role': u.role,
          'photo_url': './icon_male.png',
          'skills': u.tags.map(&:name)
        },
        'geometry': {
          'type': 'Point',
          'coordinates': [ u.location.lat, u.location.lng ]
        },
      }
    end
    render json: @people_json and return
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :phone, :birth_date, :start_date, :linkedin_url, :image)
    end
end
