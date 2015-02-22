class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_world
    World.where(:is_default => true).first
  end

  def implementors_only!
    # Soon, redirect non-implementors
  end

  def authors_only!
    # Soon, redirect non-authors
  end
end
