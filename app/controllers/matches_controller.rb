# frozen_string_literal: true

class MatchesController < ApplicationController
  before_action :setup_top_players, only: %i[general_report]

  def index ; end

  def general_report
    @matches = Match.includes(:kills, :match_players).all

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

  def setup_top_players
    @players = Player.all.sort_by { |player| player.total_kills }.reverse
    @gold_player = @players[0]
    @silver_player = @players[1]
    @bronze_player = @players[2]
  end
end
