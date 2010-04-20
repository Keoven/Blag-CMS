module ArticlesHelper
  def article_comments(comment)
    unless(comment.new_record? or comment.comment_date.nil?)
    date = comment.comment_date.strftime("%B %d, %Y")
    %Q{<div class="blog-comment">
        Comment posted #{date == DateTime.now.strftime("%B %d, %Y") ? "today" : "last " + date} #{comment.comment_date.strftime("%I:%M:%S %p")} by #{comment.email}
        <br/>
        <div class="comment-body">
        #{comment.body}
        </div>
      </div>}
    end
  end
end
