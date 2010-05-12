module ArticlesHelper

  #Returns HTML code for controls of article
  #  - Like/Unlike
  #  - Hate/Unhate
  #  - Print
  #
  def retrieve_article_controls(article, status)
    author = current_author
    str = String.new
    return link_to 'Print', print_article_path(article) if author.nil?
    begin
      url_options = { :controller => :likeables    ,
                      :action     => :update       ,
                      :article_id => article.id    ,
                      :likeable   => { :article_id  => article.id ,
                                       :author_id   => author.id  ,
                                       :like_status => 0          , }}

      likeable = article.likeables.find(:first, :conditions => "author_id = #{author.id}")
      status ||= likeable.like_status
      url_options[:id] = likeable.id
      case status
        when 1, '1'
          str << "#{link_to_remote 'Unlike', :update => 'article-controls' ,
                                             :method => :put               ,
                                             :url    => url_options         } · "
        when -1, '-1'
          str << "#{link_to_remote 'Unhate', :update => 'article-controls' ,
                                             :method => :put               ,
                                             :url    => url_options         } · "
      else
        url_options[:likeable][:like_status] = 1
        str << "#{link_to_remote 'Like', :update => 'article-controls' ,
                                         :method => :put               ,
                                         :url    => url_options         } · "

        url_options[:likeable][:like_status] = -1
        str << "#{link_to_remote 'Hate', :update => 'article-controls' ,
                                         :method => :put               ,
                                         :url    => url_options         } · "
      end
    rescue
      url_options[:action] = :create

      url_options[:likeable][:like_status] = 1
      str << "#{link_to_remote 'Like', :update => 'article-controls' ,
                                       :method => :post              ,
                                       :url    => url_options         } · "

      url_options[:likeable][:like_status] = -1
      str << "#{link_to_remote 'Hate', :update => 'article-controls' ,
                                       :method => :post               ,
                                       :url    => url_options         } · "
    end
    str << "#{link_to 'Print', print_article_path(article)}"
    return str
  end

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
    str << "<h2 class='blog-title'>Comments</h2>" unless @article.comments.nitems == 1
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
                  <div id='comment-#{comment.id}' class='comment-body'>
                    #{comment.body}
                  </div>
                    #{link_to 'Hide', "javascript:display('hide', #{comment.id})", :id => "clink-#{comment.id}"}
                </div> }
    end
    return str
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
end
