module ApplicationHelper
  def render_nav_links
    content_tag("ul", class: "right") do
      if false # is logged in
          content_tag("li") do
            link_to("Movies", movies_path)
          end + 
          content_tag("li") do
            link_to("Create Movie", new_movie_path)
          end
      else
        content_tag("li") do
          link_to("Login", "#")
        end + 
        content_tag("li") do
          link_to("Signup", "#")
        end
      end
    end
  end
end
