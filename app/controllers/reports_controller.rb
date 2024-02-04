# frozen_string_literal: true

class ReportsController < ApplicationController
  def matches
    @matches = Match.all

    respond_to do |format|
      format.json
    end
  end
end
