require "campfire_notifier"

class StatusesController < ApplicationController
  before_filter :authenticate

  skip_before_filter :verify_authenticity_token, only: [:create]

  def index
    @latest_statuses = Status.most_recent_by_person
    @older_statuses = Status.all_by_recency - @latest_statuses
  end

  def create
    status = current_person.statuses.create(params[:status])
    send_to_campfire(status)
    render nothing: true
  end

  private

  def send_to_campfire(status)
    CampfireNotifier.notify(status)
  end
end
