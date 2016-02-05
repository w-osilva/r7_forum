module PostsHelper
  def show_comments_recursive(topic_number, comments)
    html = "<ul style='list-style-type:none'>"
    comments.each_with_index do |post, i|
      index = "#{topic_number}.#{(i + 1)}"
      html +="  <li><strong>#{index}</strong>
                  <a href='/posts/#{post.id}'> #{post.created_at} </a> #{post.text}
                  <a href='/posts/#{post.id}/comment'>[Reply]</a>"
      html +=" #{show_comments_recursive("#{index}", post.comments)}" unless post.comments.empty?
      html +="</li>"
    end
    html += "</ul>"
    html
  end
end
