# frozen_string_literal: true

class MatchesController < ApplicationController
  before_action :setup_top_killers, only: %i[general_report]
  before_action :setup_top_causes, only: %i[death_cause_report]

  def index; end

  def general_report
    @matches = Match.includes(:kills, :match_players, match_players: [:player]).all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def death_cause_report
    @matches = Match.includes(:kills).all

    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def setup_top_causes
    @top_causes = Kill.select('cause_of_death, COUNT(*) AS count')
                      .group(:cause_of_death)
                      .order('count DESC')
                      .limit(3)
  end

  def setup_top_killers
    @top_killers = Player.left_joins(:kills)
                         .group('players.id')
                         .select('players.*, COUNT(kills.id) as total_kills')
                         .order('total_kills DESC')
                         .limit(3)
  end
end
