class EventsController < ApplicationController
  def index
    team = Team.find(params[:team_id])
    @events = Event.where(user_id: team.users.ids).page(params[:page]).per_page(params.fetch(:per_page, 50))
  end
end
