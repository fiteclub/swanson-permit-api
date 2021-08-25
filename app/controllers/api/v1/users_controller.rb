module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      # GET /users
      def index
        @users = User.order('id ASC')
        render 'users/index.json.jbuilder'
      end

      # GET /users/1
      def show
        render 'users/show.json.jbuilder'
      end

      # POST /users
      def create
        @user = User.new(user_params)

        if @user.save
          @user.reload
          # Reload for carrierwave, otherwise it returns null
          render json: @user, status: :created, location: api_v1_user_url(@user)
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          @user.reload
          # Reload for carrierwave, otherwise it returns null
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
        params.permit(
          :name,
          :email,
          :dob,
          :ident_num,
          :ident_state,
          :ident_expir,
          :ident_img,
          :permit_num,
          :permit_issuer,
          :permit_expir,
          :permit_img
        )
      end
    end
  end
end
