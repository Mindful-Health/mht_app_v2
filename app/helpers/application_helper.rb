module ApplicationHelper

	def current_user?(user)
	  user == current_user
	end

	def full_title(page_title)
		base_title = "Mindful Health"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
			
end
