module ArticlesHelper
  #Returns HTML code for comments of an article
  #
  def retrieve_article_comments(article)
    str = String.new
    article.comments.each do |comment|
      str << format_article_comment(comment)
    end
    return str
  end

  #Return formatted date posted with format "<Month> <Day>, <Year>"
  #
  def formatted_date_posted(article)
    article.date_posted.strftime('%B %d, %Y')
  end

  private
  #Returns HTML formatted comment
  #
  def format_article_comment(comment)
    str = String.new
    date_format = '%B %d, %Y'
    unless(comment.new_record? or comment.comment_date.nil?)
      date = comment.comment_date.strftime(date_format)
      str = %Q{ <div class='blog-comment'>
                  Comment posted #{date == DateTime.now.strftime(date_format) ? 'today' : 'last ' + date} #{comment.comment_date.strftime("%I:%M:%S %p")} by #{comment.email}
                  <br/>
                  <div class='comment-body'>
                    #{comment.body}
                  </div>
                </div> }
    end
    return str
  end
end
