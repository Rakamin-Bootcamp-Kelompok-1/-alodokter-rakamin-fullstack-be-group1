class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized, only: [:auto_login]
    

    #PAGINATION
    def index
        users = User.(params[:page]).per(params[:per_page])

        render json: {
            data: users,
            meta: {
                count: users.count,
                total: users.total_pages
            }
        }
    end

    #REGISTER
    def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

    #LOGGIN IN
    def login
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            token = encode_token({id_user: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid username or password"}
        end
    end


    #AUTO LOGIN
    def auto_login
        render json: @user
    end


    #GET USER DATA
    def getUserData
        user = User.find(params[:id_user])

        render :json => user, status: :ok

    rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e
        }, status: :not_found
    end

    #UPDATE USER
    def updateUserData
        user = User.find(params[:id_user])

        user.update(update_params)

        render :json => user
        #, status: :token

    rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e 
        }, status: :not_found
    end

    #DELETE USER
    def deleteUser
        user = User.find(params[:id_user])

        user.destroy

        render :json => {}, status: :ok

    rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e
        }, status: :not_found
    end


    private

    def user_params
        params.permit(:full_name, :password, :age, :email, :gender, :birth_date, :phone_number, :image_path, :is_admin, :is_active)
    end

    def update_params
        params.permit(:full_name, :password, :age, :email, :gender, :birth_date, :phone_number, :image_path, :is_admin, :is_active)
    end
end
