class UsersController < ApplicationController
  autocomplete :user, :username, :extra_data => [:id]
  before_filter :login_required
  before_filter :other_user_check, :only => [:my_account, :followers, :followings, :follow]
  
  def my_account
    @tab = Tab.new
    @site = TabSite.new
    @tabs = @login_user.shared_tabs_with(@other_user.id)
    @discussions = @other_user.discussions.find(:all,:offset => 0, :limit => 10,:order => "created_at DESC")
    @notifications = DiscussionGroupUser.find(:all, :conditions => ['user_id =? AND is_member=?', @login_user.id, false])
  end

  #Created by: Deepali Thaokar
  #Created on: 05/01/2012
  #Purpose:
  #++ This method is used to create tab
  def add_tab
    if params[:tab]
      @tab = Tab.new(params[:tab])
      @tab.share_type = 1
      flash[:notice]= @tab.save ? "Tab created sucessfully." : "Tab not created."
      redirect_to "/users/profile/#{@login_user.id}"
    end
  end

  #Created by: Deepali Thaokar
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used to update tab name
  def edit_tab
    @tab = Tab.find(params[:tab][:id])
    @tab.update_attributes(params[:tab])
    flash[:notice]="Tab updated sucessfully."
    redirect_to "/users/profile/#{@login_user.id}"
  end


  #Created by: Deepali Thaokar
  #Created on: 05/01/2012
  #Purpose:
  #++ This method is used to create site urls under a tab
  def create_site
    if params[:site]
      @site_url = TabSite.new(params[:site])
      flash[:notice]= @site_url.save ? "Tab site created sucessfully." : "Tab site not created."
      redirect_to "/users/profile/#{@login_user.id}"
    end
  end

  #Created by: Deepali Thaokar
  #Created on: 06/01/2012
  #Purpose: update site url
  def edit_site_url
    @site_url = TabSite.find(params[:site][:id])
    @site_url.update_attributes(params[:site])
    flash[:notice]="Site updated sucessfully."
    redirect_to "/users/profile/#{@login_user.id}"
  end

  #Created by: Deepali Thaokar
  #Created on: 05/01/2012
  #Purpose:
  #++ This method is used to create multiple site urls under a tab
  def add_current_tab
    if params[:current_tab]
      site = Tab.find(params[:current_tab][:tab_id])
      site.add_bulk_sites(params[:current_tab][:site_url])
      flash[:notice]="Site urls added sucessfully under #{site.name}."
      redirect_to "/users/profile/#{@login_user.id}"
    end
  end

  #Created by: Deepali Thaokar
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used to delete a tab
  def delete_tab
    @tab = Tab.find(params[:id])
    SharedTab.delete_all("shareable_id=#{@tab.id} and shareable_type='#{@tab.class.to_s}'")
    @tab.destroy
    
    flash[:notice] = 'Tab deleted successfully.'
    redirect_to "/users/profile/#{@login_user.id}"
  end

  #Created by: Deepali Thaokar
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used to delete site url
  def delete_site_url
    @site_url = TabSite.find_by_id(params[:id])
    @site_url.destroy if @site_url
    respond_to do |format|  
      format.js   { render :nothing => true }  
    end 
  end

  #Created by: Salil Gaikwad
  #Created on: 07/01/2012
  #Purpose:
  #++ This method is used to find the auto populate active, search user
  def get_autocomplete_items(parameters)
    session[:from_follower_following] ?  @login_user.from_follower_following(parameters[:term]) : @login_user.all_message_users(parameters[:term])
  end

  #Created by: Salil Gaikwad
  #Created on: 09/01/2012
  #Purpose:
  #++ This method is used for find user name for sending message to them
  def search_user_names_for_message
    @users = (session[:from_follower_following] ?  @login_user.from_follower_following(params[:term]) : @login_user.all_message_users(params[:term]))
    @usernames = []
    @users.collect{|u| @usernames << u.username}
    respond_to do |format|
      format.json { render :json => @usernames }
    end
  end

  #Created by: Satish Zol
  #Created on: 05/04/2012
  #Purpose:
  #++ This method is used for find public group
  def search_for_group
    @groups = @login_user.all_groups(params[:term])
    @usernames = []
    @groups.collect{|group| @usernames << group.name}
    respond_to do |format|
      format.json { render :json => @usernames }
    end
  end

  #Created by: Satish Zol
  #Created on: 09/01/2012
  #Purpose:
  #++ This method is used for find people page
  def find_people
    @users=[]
    session[:search_opt] = params[:user]
    if request.post?
      @users = @login_user.search_query(params[:user],1)
      flash[:notice] = "No results found." if @users.empty?
    end
  end

  #Created by: Salil Gaikwad
  #Created on: 10/01/2012
  #Purpose:
  #++ This method is used to update users Profile Details
  def update
    @detail = @login_user.user_detail
    @login_user.attributes = params[:user]
    @detail.attributes = params[:user_detail]
    (@login_user.valid? & @detail.valid?) && @login_user.save && @detail.save
    respond_to do |format|  
      format.js
    end 
  end

  #Created by: Salil Gaikwad
  #Created on: 10/01/2012
  #Purpose:
  #++ This method is used to update users Profile Details
  def edit_profile_picture
    picutre = ProfilePicture.new(params[:profile_picture])
    #flash[:notice] = activerecord_error_list(picutre.errors)
    if picutre.save
      pre_pic = ProfilePicture.find(:first,:conditions=>["user_id=#{picutre.user_id} and id!=#{picutre.id}"])
      pre_pic.destroy if !pre_pic.nil?
    else
      flash[:notice] = picutre.errors.first[1] unless picutre.save
    end
    redirect_to "/users/profile/#{@login_user.id}"
  end

  #Created by: Salil Gaikwad
  #Created on: 12/01/2012
  #Purpose:
  #++ This method is used to update users Profile Details
  def rate
    @rate = params[:rating_for_class] == "discussion" ? Discussion.find(params[:id]) : Comment.find(params[:id])
    @rate.rate_it(params[:score], current_user)
    respond_to do |format|
      format.js
    end
  end

  #Created by: Salil Gaikwad
  #Created on: 12/01/2012
  #Purpose:
  #++ This method is used to create a raletion between (follower-following) users
  def follow
    FollowerFollowing.create(:follower_id => @login_user.id, :following_id => params[:id])

    @default_group = User.find(params[:id]).default_group[0]
    @group = Group.create(:name=>"Default",:user_id=>params[:id]) if @default_group.nil?
    group = @default_group.nil? ? @group : @default_group
    GroupUser.create(:user_id=>@login_user.id,:group_id=>group.id)
    @default_group = nil

    @default_group = @login_user.default_group[0]
    @group = Group.create(:name=>"Default",:user_id=>@login_user.id) if @default_group.nil?
    group = @default_group.nil? ? @group : @default_group
    GroupUser.create(:user_id=>params[:id],:group_id=>group.id)
    
    #By default get email updates from followed members
    get_email = FollowerFollowing.where('follower_id=? and following_id=?', @login_user.id, params[:id]).first
    get_email.update_attributes(:get_email_updates => !get_email.get_email_updates)
    redirect_to "/users/profile/#{params[:id]}"
  end

  #Created by: Satish Zol
  #Created on: 23/01/2012
  #Purpose:
  #++ This method is used to create a raletion between (follower-following) users
  def set_email_updates
    get_email = FollowerFollowing.where('follower_id=? and following_id=?', @login_user.id, params[:id]).first
    get_email.update_attributes(:get_email_updates => !get_email.get_email_updates)
    redirect_to "/users/profile/#{params[:id]}"
  end

  #Created by: Salil Gaikwad
  #Created on: 12/01/2012
  #Purpose:
  #++ This method is used to show followers for the user (both login user and visited profile user)
  def followers
    @followers = @other_user.followers.paginate(:page => params[:page], :per_page => 20)
  end

  #Created by: Salil Gaikwad
  #Created on: 12/01/2012
  #Purpose:
  #++ This method is used to show followings for the user (both login user and visited profile user)
  def followings
    @followings = @other_user.followings.paginate(:page => params[:page], :per_page => 20)
  end

  #Created by: Satish Zol
  #Created on: 14/01/2012
  #Purpose:
  #++ This method is used to delete followers and followings
  def follower_following_delete
    @follower_following = FollowerFollowing.find(params[:id])
    
    @group_user = GroupUser.find_by_sql(["SELECT gu.* FROM (group_users gu LEFT JOIN groups g ON g.id=gu.group_id) WHERE (g.user_id=#{@login_user.id} AND gu.user_id=#{@follower_following.following.id}) OR (g.user_id=#{@follower_following.following.id} AND gu.user_id=#{@login_user.id})"])#:user_id=>@login_user.id,:group_id=>group.id)
    @group_user = GroupUser.find_by_sql(["SELECT gu.* FROM (group_users gu LEFT JOIN groups g ON g.id=gu.group_id) WHERE (g.user_id=#{@follower_following.follower.id} AND gu.user_id=#{@login_user.id}) OR (g.user_id=#{@login_user.id} AND gu.user_id=#{@follower_following.follower.id})"]) if @group_user.blank?
    @group_user.each do |g_u|
      g_u.destroy
    end
    @follower_following.destroy
    render :text=>"Success"
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 28/01/2012
  #Purpose:This method is used to set tab as private
  #++ 
  def set_tab_private
    @tab = Tab.find(params[:id])
    @tab.update_attribute('share_type', 1)
    SharedTab.delete_all(:shareable_id=>@tab.id)
    flash[:notice]="#{@tab.name} tab is set to private."
    redirect_to :back
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 28/01/2012
  #Purpose:This method is used to set tab as public
  #++ 
  def set_tab_public
    @tab = Tab.find(params[:id])
    @tab.update_attribute('share_type', 0)
    SharedTab.delete_all(:shareable_id=>@tab.id)
    flash[:notice]="#{@tab.name} tab is set to public."
    redirect_to :back
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 28/01/2012
  #Purpose:This method is used to set tab as public
  #++
  def share_with_group
    if request.post?
      @group_ids = params[:group_ids]
      @tab = Tab.find(params[:tab_id])
      @pre_group_ids = Array.new
      @login_user.groups_having_shared(params[:id]).each do |g|
        @pre_group_ids<< g.id
      end if !@login_user.groups_having_shared(params[:id]).blank?
      
      @pre_group_ids.each do |g_id|
        SharedTab.delete_all("shareable_id=#{@tab.id} AND shareable_type='#{@tab.class.to_s}' AND group_id=#{g_id}") if g_id and !@group_ids.include?(g_id)
      end if !@pre_group_ids.blank? and !@group_ids.blank?
      
      @group_ids.each do |g_id|
        SharedTab.create(:shareable_id=>params[:tab_id].to_i,:shareable_type=>@tab.class.to_s,:group_id=>g_id)
      end if !@group_ids.blank?
      
      
      if(@group_ids.blank?)
        flash[:notice]="At least one group must be selected to share the tab."
      else
        @tab.update_attribute('share_type', 2)
        flash[:notice]="#{@tab.name} Tab shared successfully."
      end
      
      redirect_to :back
    else
      render :partial=>"share_tab_with_group", :locals=>{:user=>@login_user}, :layout=>false
    end
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 30/01/2012
  #Purpose: To manage groups
  #++
  def manage_groups
    @other_user = @login_user
    @groups = @login_user.groups
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 30/01/2012
  #Purpose: To create group
  #++
  def create_group
    @group = Group.new(:name=>params[:group][:name],:user_id=>@login_user.id)
    @notice = @group.save ? "Group created successfully.":"Group name already exist."

    respond_to do |format|
      format.js
    end
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 30/01/2012
  #Purpose: To delete group
  #++
  def delete_group
    @group = Group.find(params[:id])
    @created_g_u= Array.new
    @defalut_group = @login_user.default_group[0]
    @group.group_users.each do |g_u|
      g_u.destroy
      group = @login_user.belongs_to_group(g_u.user_id)
      if group.blank?
        group_user = GroupUser.new(:user_id=>g_u.user_id,:group_id=>@defalut_group.id) if group.blank?
        @created_g_u << group_user if group_user.save
      end   
    end
    @group.destroy
    #redirect_to :back
    respond_to do |format|
      format.js
    end
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 30/01/2012
  #Purpose: To edit group
  #++
  def edit_group
    @group = Group.find(params[:group][:id])
    @notice = @group.update_attributes(:name=> params[:group][:name]) ? "Group name updated successfully." : "Group name already exist."
    #redirect_to :back
    respond_to do |format|
      format.js
    end
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 30/01/2012
  #Purpose: add to group
  #++
  def add_to_group
    if request.post?
      @user_id = params[:user_id]
      @group = params[:group_ids]
      @created_g_u= Array.new
      @group.each do |g|
        #g_user = GroupUser.find(:all,:conditions=>["user_id=#{@user_id.to_i} and group_id=#{g.to_i}"])
        group_user = GroupUser.create(:user_id=>@user_id.to_i,:group_id=>g.to_i)# if g_user.blank?
        @created_g_u << group_user if group_user.id
      end
      @notice = "Successfully added to group."
      respond_to do |format|
        format.js
      end
      
    else
      render :partial=>"add_to_group_form", :locals=>{:user=>@login_user,:user_id=>params[:id]}, :layout=>false
    end
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 30/01/2012
  #Purpose: remove user from group
  #++
  def remove_from_group
    @group_user = GroupUser.find(params[:id])
    @user_id = @group_user.user_id
    if !@login_user.belongs_to_group(@user_id).blank?
      @group_user.destroy
      @deleted = true
      @notice = "User removed from group successfully."
      @group_user = @login_user.belongs_to_group(@user_id)
      if @group_user.blank?
        @defalut_group = @login_user.default_group[0]
        @new_group_user = GroupUser.create(:user_id=>@user_id,:group_id=>@defalut_group.id)
      end
    else
      @notice = "The user must belongs to atleast one group."
    end
    respond_to do |format|
      format.js
    end
    
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 30/01/2012
  #Purpose: load more search result
  #++
  def load_more_search_result
    @users=[]
    @users = @login_user.search_query(session[:search_opt],params[:page].to_i)
    render :partial => "search_user_result"
    #render :text => "yes"
  end

end
