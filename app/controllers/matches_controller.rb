# frozen_string_literal: true

class MatchesController < ApplicationController
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
end
