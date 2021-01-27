module ApplicationHelper
  def render_nav_links(signed_in)
    content_tag("ul", class: "right") do
      if signed_in # is logged in
          content_tag("li") do
            link_to("Movies", movies_path)
          end + 
          content_tag("li") do
            link_to("Create Movie", new_movie_path)
          end + 
          content_tag("li") do
            link_to("Logout", destroy_user_session_path, method: "DELETE")
          end
      else
        content_tag("li") do
          link_to("Login", login_path)
        end + 
        content_tag("li") do
          link_to("Signup", signup_path)
        end
      end
    end
  end
end
