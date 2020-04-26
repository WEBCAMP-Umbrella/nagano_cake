class Admin::HomeController < ApplicationController
  before_action :authenticate_admin!

  def index
  	range = Time.current.beginning_of_day..Time.current.end_of_day
  	@orders = Order.where(created_at: range).count
  end
end
