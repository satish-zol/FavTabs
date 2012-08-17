module DiscussionGroupsHelper

  def box_border_shadow(discussion)
    str = "discussions"
    
    if discussion.is_url
      str = "discussions"
    else
      str = "commments_questions"
    end

    discussion.discussion_attachments.each do |att_file|
      if att_file.file_content_type == "application/pdf"
        str = "disc_with_pdf"
      elsif att_file.file_content_type == "application/msword"
        str = "disc_with_doc"
      elsif att_file.file_content_type == "image/jpeg"
        str = "disc_with_picture"
      end
    end


    str
  end
end
