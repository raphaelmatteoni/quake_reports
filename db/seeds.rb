# frozen_string_literal: true

Log::Parser.new(File.open('db/seeds/qgames.log')).call
