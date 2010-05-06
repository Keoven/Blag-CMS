module ArticlesHelper

  #Returns HTML code for articles
  #
  def retrieve_articles(articles)
    str = String.new
    articles.each_with_index do |article, i|
      str << "<tr class='#{ i % 2 == 1 ? 'rowodd' : 'roweven' }'>"
      str << format_article(article)
      str << "</tr>"
    end
    return str
  end

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
    article.date_posted.strftime('%B %d, %Y') unless article.date_posted.nil?
  end

  private
  #Returns HTML formatted article
  #
  def format_article(article)
    %Q{ <td>#{truncate(article.title, :length => 10)}</td>
        <td>#{truncate(article.body, :length => 10)}</td>
        <td>#{article.status}</td>
        <td>#{full_name(Author.find(article.author_id))}</td>
        <td>#{formatted_date_posted(article)}</td>
        <td class="article-index-entry">#{link_to 'Edit', edit_article_path(article), :class => 'offlink'}</td>
        <td class="article-index-entry">#{link_to 'Show', article_path(article), :class => 'offlink'}</td>
        <td class="article-index-entry">#{link_to 'Delete', article, :confirm => "Are you sure you wane to delete article \"#{article.title}\"?",
                                                                     :method => :delete,
                                                                     :class => 'offlink'}</td> }
  end
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
