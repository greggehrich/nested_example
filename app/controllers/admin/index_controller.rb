class Admin::IndexController < ApplicationController

  before_filter :authenticate

  layout 'admin'

  def index
  end

end
