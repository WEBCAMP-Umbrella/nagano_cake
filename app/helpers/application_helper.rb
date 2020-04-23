module ApplicationHelper
  def post_code(postal_code)
      "#{postal_code.insert(3, "-")}"
  end

  def yen(price)
    "￥#{price.to_s(:delimited)}"
  end
end
