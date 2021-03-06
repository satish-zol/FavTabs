class LoginsController < ApplicationController
  before_filter :already_login, :except=>['about_us', 'contact_us', 'logout']

  def home
     @user = User.new
     @users = User.new
    if current_user
      redirect_to "/users/profile/#{current_user.id}"
    end
  end

  def invitation_sign_up
    @user = User.new
    @users = User.new
    non_site_user = NonSiteUser.find(params[:id])
    @user_email = non_site_user.email
    @group_id = non_site_user.invitable_id
    if current_user
      redirect_to "/users/profile/#{current_user.id}"
    end
    render :action => 'home'
  end


  def login
    if request.post?
      par = params[:user] ? params[:user] : params[:users]
      @user= User.authenticate(par[:username], par[:password])
      if @user.present?
        session[:user] = @user
        redirect_to "/users/profile/#{@user.id}"
      else
        flash[:error]  =  'Invalid username or password.'
        redirect_to :action => "home"
      end
    else
      redirect_to :action => "home"
    end
  end

  def create
    host_port= request.host_with_port
    @user = User.new(params[:user])
    @user.system_role = 10
    @user_detail = @user.build_user_detail
    @users = User.new
    non_site_user = NonSiteUser.find(params[:invitation_id]) if params[:group_id]!='0'
    @user_email = params[:group_id]=='0' ? nil : params[:user][:email]
    @group_id = params[:group_id]=='0' ? nil : params[:group_id]
    if @user.save
      @user.activate if non_site_user.present?
      DiscussionGroupUser.create(:discussion_group_id => non_site_user.invitable_id, :user_id => @user.id, :is_member => 0) if non_site_user.present?
      non_site_user.destroy unless non_site_user.blank?
      Notifier.mail_to_user(@user, host_port).deliver unless non_site_user.blank?
      flash[:notice] = "User created successfully #{', please activate your account' unless non_site_user.blank?}."
      redirect_to :action => "home"
    else
      flash[:error]  = activerecord_error_list(@user.errors)
      render :action => "home"
    end
  end

  # This method is used to set nil value to session after click on logout button .
  def logout
    reset_session
    redirect_to :action => 'home'
  end

  # This method is used to activate the user.
  def activate
    if params[:id]
      @user = User.find_by_confirmation_token(params[:id])
      if @user.present?
        @user.activate
        flash[:notice] = "User activated successfully."
        Notifier.confirm_user(@user).deliver
      else
        flash[:notice] = "User already activated."
      end
    else
      flash[:notice] = "You do not have Activation Code."
    end
    redirect_to :action => "home"
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 12/01/12
  #Purpose: To get new password through mail
  #++
  def forgot_password
    if request.post?
      @user=User.find(:first, :conditions => ["email=? AND system_role=?", params[:user][:email], User::SYSTEM_ROLE_USER])
      if @user.present?
        o =  [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten;
        newpass  =  (0..6).map{ o[rand(o.length)]  }.join;
        #newpass = (1..7).map{ (0..?z).map(&:chr).grep(/[a-z\d]/i)[rand(62)]}.join
        @user.encrypted_password = newpass
       
        Notifier.send_password(@user, newpass).deliver if @user.save
        flash[:notice] = "New password is sent to your email id."
      else
        flash[:forget_pw__error] = "Error"
        flash[:notice] = "Email is not registered."
      end
      redirect_to :action => "home"
    end
  end


end
