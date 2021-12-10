class PasswordMailer < ApplicationMailer
    def reset_password(user)
        @user = user
        # @link = "localhost:4000/reset_password?reset_password_token=#{user.reset_password_token}"
        mail(to: @user.email, subject: "Reset your password")
    end
end
