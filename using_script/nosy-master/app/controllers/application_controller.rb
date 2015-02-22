class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_person
    @current_person
  end

  def authenticate
    authenticate_or_request_with_http_basic do |_, token|
      @current_person = Person.authenticate(token)
    end
  end
end
