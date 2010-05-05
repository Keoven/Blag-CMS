module ApplicationHelper
  #Returns full name of author where the format is '<first_name> <last_name>'
  #
  def full_name(author)
    author.first_name + ' ' + author.last_name
  end

  #Returns the 10 most current posted articles
  #except the currently shown article if any
  #
  def retrieve_side_pane_contents(current_article)
    current_article = nil if current_article.new_record?
    str = String.new
    Article.recent_posts(10, (current_article.nil?) ? "" : "AND id <> \"#{current_article.id}\"" ).each do |article|
      str << %Q{ #{ link_to "#{truncate(article.title, :length => 20)}", article_path(article), :style => 'text-shadow: 1px 1px black' }
                 <span style='float:right; color:white; text-shadow: 1px 1px black;'>by #{full_name(article.author)}</span>
                 <br/> }
    end
    return str
  end
end
