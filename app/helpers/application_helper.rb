module ApplicationHelper
  def parse_text(text)
    text = text.gsub /@(\w+)/ do |username|
      name = username.gsub('@', '')
      user = User.find_by_name(name)
      if user.present?
        text = link_to(username, user_path(name))
      else
         text = username
      end
   end
    sanitize text.gsub(/\n/, '<br/>'), tags: %w{ br a }, attributes: %w{ href }
  end
end
