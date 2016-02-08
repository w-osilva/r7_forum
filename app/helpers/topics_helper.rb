module TopicsHelper

  def get_html_nested_comments(topic_number, comments)
    html = "<ul style='list-style-type:none'>"
    comments.each_with_index do |c, i|
      index = (c.is_first_level?) ? get_index_by_page + (i + 1) : (i + 1)
      index = "#{topic_number}.#{index}"
      html +="  <li><strong>#{index}</strong>
                  #{c.created_at} #{SimpleBlacklist.sanitize c.text}
                  <a href='/topics/#{c.get_topic.id}/comments/#{c.id}/comments/new'>[Reply]</a>"
      html +=" #{get_html_nested_comments("#{index}", c.comments)}" unless c.comments.empty?
      html +="</li>"
    end
    html += "</ul>"
    html
  end

  def get_index_by_page
    page = (params[:page].to_i < 2) ? 1 : params[:page].to_i
    ((page - 1) * Comment::PER_PAGE)
  end
end
