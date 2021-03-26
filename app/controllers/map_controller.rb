class MapController < ApplicationController
  def index
    @squads = Squad.all
    @roles = User.roles
  end
end
