class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    # Confirm Password Update
    if user_params[:password].present? || user_params[:password_confirmation].present?
      if user_params[:password] != user_params[:password_confirmation]
        @user.errors.add(:password, "Passwords do not match")
        return render :edit, status: :unprocessable_entity
      end
      update_params = user_params
    else
      update_params = user_params.except(:password, :password_confirmation)
    end

    # Confirm Other Update
    if @user.valid_password?(user_params[:current_password])
      update_params = update_params.except(:current_password)
      if @user.update(update_params)
        redirect_to user_path(@user)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      @user.errors.add(:current_password, "is incorrect")
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:job_num, :first_name, :last_name, :first_name_kana, :last_name_kana, :department_id, :email, :password, :password_confirmation, :current_password)
  end

end