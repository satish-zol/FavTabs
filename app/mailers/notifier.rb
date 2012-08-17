class Notifier < ActionMailer::Base
  default :from => "demo@cipher-tech.com",
          :bcc => ["salil@cipher-tech.com"]


  def confirm_user(user)
    @username= user.username
    @sent_on =  Time.now
    mail(:to => user.email,
         :subject => 'Welcome To FavTabs')
  end

  def mail_to_user(user, host)
    @username = user.username
    @url  = "http://"+host+"/logins/activate/#{user.confirmation_token}"
    mail(:to => user.email,
         :subject => 'Thanks For Registering! Confirm Your Email')
  end

  #Created by: Satish Zol
  #Created on: 07/01/2012
  #Purpose:
  #++ This method is send a mail to new message
  def msg_mail_to_user(message)
    @message = message.message
    @sent_on =  Time.now
    mail(:to => message.recipient.email,
      :subject => "#{message.sender.username} sent message for you")
  end

  #Created by: Deepali Thaokar
  #Created on: 09/01/2012
  #Purpose:
  #++ This method is send a mail to discussion poster
  def mail_to_user_on_discussion(comment,discussion_poster)
    @comment = comment.comment
		@discussion_url = comment.discussion.discussion
		@discussion_user = comment.user.username
    @discussion = comment.discussion
    @sent_on =  Time.now
      mail(:to => discussion_poster.email,
        :subject => "#{@discussion_user} commented on your link")
  end

  #Created by: Jalendra Bhanarkar
  #Created on: 12/01/2012
  #Purpose:
  #++ This method used to send new password
  def send_password(user, newpass)
    @message = "Your new password is "+newpass
    @sent_on =  Time.now
    mail(:to => user.email,
         :subject => 'Your password has been changed.')
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 23/01/2012
  #Purpose:
  #++ This method is used to send an email to followers of user who marked email updates when user
  # add discussion.
  def mail_to_follower(follower_following, discussion)
    @discussion = discussion
    @author = follower_following.following
    @sent_on =  Time.now
    mail(:to => follower_following.follower.email,
         :subject => 'New Discussion.')
  end

  #Created by: Satish Zol
  #Created on: 29/02/2012
  #Purpose:
  #++ This method is send a mail to new message
  def mail_to_user_on_photo_comment(photo_comment)
    @photo_comment = photo_comment.comment
    @photo_comment_username = photo_comment.user.username
    @sent_on =  Time.now
    mail(:to => photo_comment.discussable.album.user.email,
      :subject => "#{@photo_comment_username} commented on your photo")
  end

  #Created by: Satish Zol
  #Created on: 05/04/2012
  #Purpose:
  #++ This method is send a mail to new message
  def mail_to_private_group_user(email, username, host, group)
    @flag = User.find(:all, :conditions => ['email=?', @email]).blank?
    @email = email
    @private_group_user = email
    @username = username
    @url  = "http://"+host+"/"
    @group = group
    @sent_on = Time.now
    mail(:to => @private_group_user, :subject => "#{@username} has invited you to join the group #{@group} on Tabitt.com.")
    
  end

  #Created by: Satish Zol
  #Created on: 12/04/2012
  #Purpose:
  #++ This method is send a mail to new message
  def mail_to_non_site_user(email, username, host, group, group_id)
    @flag = User.find(:all, :conditions => ['email=?', @email]).blank?
    @email = email
    @private_group_user = email
    @username = username
    @url  = "http://"+host+"/logins/invitation_sign_up/#{group_id}"
    @group = group
    @sent_on = Time.now
    mail(:to => @private_group_user, :subject => "#{@username} has invited you to join the group #{@group} on Tabitt.com.")

  end

  #Created by: Satish Zol
  #Created on: 07/04/2012
  #Purpose:
  #++ This method is send a mail to new message
  def mail_to_group_member(email, username, host, group, discussion)
    @email = email
    @group_user = email
    @username = username
    @url  = "http://"+host+"/"
    @group = group
    @discussion = discussion
    @sent_on = Time.now
    mail(:to => @group_user, :subject => "New Discussion.")

  end

  #Created by: Satish Zol
  #Created on: 05/04/2012
  #Purpose:
  #++ This method is send a mail to new message
  def mail_to_nsu_on_disc(email, username, host, discussion)
    @nsgu = email
    @username = username
    @url  = "http://"+host+"/"
    @discussion = discussion
    @sent_on = Time.now
    mail(:to => @nsgu, :subject => "#{@username} has invited you to join a discussion on Tabitt.com.")

  end
  

end
