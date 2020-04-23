module ApplicationHelper
  def post_code(postal_code)
      "#{postal_code.insert(3, "-")}"
  end

  def yen(price)
    if price.class == Integer
    "￥#{price.to_s(:delimited)}"
    else
      "￥#{price.to_i.to_s(:delimited)}"
    end
  end
end
