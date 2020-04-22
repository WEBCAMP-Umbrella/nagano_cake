module ApplicationHelper
  def post_code(postal_code)
      "#{postal_code.insert(3, "-")}"
  end
end
