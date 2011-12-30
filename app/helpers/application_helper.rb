module ApplicationHelper
  def title(page_title)
  if page_title.nil?
    content_for(:title) {"Gig for 20 Kuai"}
  else
    content_for(:title) {page_title}
  end
  end
end
