class PasswordsController < ApplicationController
    
    def forgot
        if params[:email].blank?
        return render json: {error: "Email not present"}, status: 400
        end

        user = User.find_by(email: params[:email]) # if present find user by email

        if user.present?
        user.generate_password_token! #generate pass token
        #SEND EMAIL HERE
        PasswordMailer.reset_password(user).deliver_now
        render json: {status: "Email has been sent to your email, please kindly check to reset your password."}, status: :ok
        else
        render json: {error: ["Email address not found. Please check and try again."]}, status: :not_found
        end
    end

  def edit
    @user = User.find_by(email: params[:email])
   
  end

  def reset
    token = params[:token].to_s

    if params[:email].blank?
      return render json: {error: "Token not present"}
    end

    user = User.find_by(reset_password_token: params[:reset_password_token])

    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: {message: "Your password has successfully been updated."}, status: 200
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error:  ["Link not valid or expired. Try generating a new link."]}, status: :not_found
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password)
  end
end
