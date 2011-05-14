module ForumsHelper
  
  def admin_signed_in_show_edit_forum(forum_id)
    if user_signed_in? and current_user.id == 1
      link_to("edit", edit_forum_path(forum_id))
    end
  end
  
  def admin_signed_in_show_delete_forum(forum_id)
    if user_signed_in? and 1 == current_user.id
      link_to("delete", forum_path(forum_id), :method => :delete, :confirm => "Are you sure ?")
    end
  end
  
  def admin_signed_in_show_create_forum
    if user_signed_in? and 1 == current_user.id
      link_to("Create a new forum", new_forum_path)
    end
  end
  
  def user_signed_in_show_create_post(forum_id)
    if user_signed_in?
      link_to("New post", new_forum_post_path(forum_id))
    else
      link_to("Sign in to post a new article", new_user_session_path)
    end
  end
  
  def user_can_edit_own_post(user_id, forum, post)
    if user_signed_in? and current_user.id == user_id
      link_to("Edit", edit_forum_post_path(forum, post))
    end
  end
  
  def user_can_delete_own_post(user_id, forum, post)
    if user_signed_in? and current_user.id == user_id
      link_to("Delete", forum_post_path(forum, post), :method => :delete, :confirm => "Are you sure ?")
    end
  end
  
  def user_welcome_message
    if user_signed_in?
      render :text => "Hello! #{current_user.login}"
      #link_to("sign out", destroy_user_session_path)
    else
      render :text => "Hello! Stranger "
      #link_to("sign in", new_user_session_path)
      #link_to("sign up", new_user_registration_path)
    end
  end
  
  #the following helpers used in user bar
  def user_signin_signout_link
    if user_signed_in?
      link_to("[ Sign out ]", destroy_user_session_path)
    else
      link_to("[ Sign in ]", new_user_session_path)
    end
  end
  
  def user_signup_link
    if not user_signed_in?
      link_to("[ Register ] ", new_user_registration_path)
    end
  end
  
  def user_account_link
    if user_signed_in?
      link_to("[ My account ]", edit_user_registration_path)
    end
  end
  
end
