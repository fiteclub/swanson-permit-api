class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    render json: JSON.pretty_generate(@users)
  end

  # GET /users/1
  def show
    render json: JSON.pretty_generate(generate_user_hash(@user))
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :dob,
      :ident_num,
      :ident_state,
      :ident_expir,
      :ident_img,
      :recom_num,
      :recom_issuer,
      :recom_expir,
      :recom_img
    )
  end

  def generate_user_hash(user)
    {
      id: user.id,
      name: user.name,
      email: user.email,
      birthdate: user.dob,
      identification: generate_identification_hash(user),
      recommendation: generate_recommendation_hash(user)
    }
  end

  def generate_identification_hash(user)
    if user.identification_expired?
      'EXPIRED'
    else
      {
        number: user.ident_num,
        state: user.ident_state,
        expiration: user.ident_expir,
        image: user.ident_img
      }
    end
  end

  def generate_recommendation_hash(user)
    if user.recommendation_expired?
      'EXPIRED'
    else
      {
        number: user.recom_num,
        issuer: user.recom_issuer,
        expiration: user.recom_expir,
        image: user.recom_img
      }
    end
  end
end
