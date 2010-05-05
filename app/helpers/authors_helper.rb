module AuthorsHelper
  #Return list of all authors
  def author_list(authors)
    str = String.new
    if authors.nitems != 0
      i = 0
      authors.each do |author|
        str << author_pane(author, i)
        i += 1
      end
    end
    return str
  end

  private
  #Returns the author's HTML formatted author entry for Authors Index
  #
  def author_pane(author, i)
    <<-STR
    #{(i % 2 == 1) ? "<div class='rowodd'><table>" : "<div class='roweven'><table>"}
    <tr>
      <th>Name:</th>
      <td>#{full_name(author)}</td>
    </tr>
    <tr>
      <th>Birthday:</th>
      <td>#{author.birthday.strftime('%B %d, %Y')}</td>
    </tr>
    <tr>
      <th colspan='2'>Articles:</th>
    </tr>
    #{str = String.new
      author.articles.each do |article|
        str << "<tr><td colspan='2' class='article'>#{link_to "#{article.title}", article_path(article)}</td></tr>"
      end
      str.empty? ? "<tr><td colspan='2' class='article'>None</td></tr>" : str}
    <tr>
      <td style='height: 10px'>
      </td>
    </tr>
    <tr>
      <td colspan='2' class='cellcontrol'>
        #{link_to 'Edit', edit_author_path(author)} #{link_to 'Show', author_path(author)}
        #{link_to 'Delete', author, :confirm => "Are you sure you wane to delete author \"
        #{full_name(author)}\"?", :method => :delete}
      </td>
    </tr>
    </table></div>
    STR
  end
end
