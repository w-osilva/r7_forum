module TopicsHelper
  def show_nested_comments(topic_number, comments)
    comments = comments.select { |c| c.comment.nil? }
    get_html_nested_comments(topic_number, comments)
  end

  def get_html_nested_comments(topic_number, comments)
    html = "<ul style='list-style-type:none'>"
    comments.each_with_index do |c, i|
      index = "#{topic_number}.#{(i + 1)}"
      html +="  <li><strong>#{index}</strong>
                  #{c.created_at} #{c.text}
                  <a href='/topics/#{c.topic.id}/comments/#{c.id}/comments/new'>[Reply]</a>"
      html +=" #{get_html_nested_comments("#{index}", c.comments)}" unless c.comments.empty?
      html +="</li>"
    end
    html += "</ul>"
    html
  end
end
