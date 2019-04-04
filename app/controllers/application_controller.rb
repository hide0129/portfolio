class ApplicationController < ActionController::Base
  # include Jpmobile::ViewSelector
  protect_from_forgery with: :exception

  before_action :set_view_path

  private
  def set_view_path
    path =  request.smart_phone? ? 'smartphone' : 'pc'
    prepend_view_path(Rails.root + 'app/views' + path)
  end
end
