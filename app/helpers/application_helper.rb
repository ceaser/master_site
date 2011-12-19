module ApplicationHelper

  def site_title
     !@customer.nil? ? @customer.name : "Master Site"
  end
end
