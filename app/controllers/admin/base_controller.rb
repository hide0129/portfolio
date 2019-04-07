class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :http_basic_authenticate

  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == 'hyde0129lec' && password == 'hide57740408'
    end
  end
end
