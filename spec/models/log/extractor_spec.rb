# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Log::Extractor do
  describe '.game_name' do
    it 'extracts game name from the row' do
      row = '20:37 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv_maxRate\10000\sv_minRate\0' \
      '\sv_hostname\Code Miner Server\g_gametype\0\sv_privateClients\2\sv_maxclients\16' \
      '\sv_allowDownload\0\bot_minplayers\0\dmflags\0\fraglimit\20\timelimit\15' \
      '\g_maxGameClients\0\capturelimit\8\version\ioq3 1.36 linux-x86_64 Apr 12 2009' \
      '\protocol\68\mapname\q3dm17\gamename\baseq3\g_needpass\0'

      expect(Log::Extractor.game_name(row)).to eq('baseq3')
    end
  end

  describe '.player_name' do
    it 'extracts player name from the row' do
      row = '20:38 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\uriel/zael\hmodel\uriel/zael' \
      '\g_redteam\\g_blueteam\\c1\5\c2\5\hc\100\w\0\l\0\tt\0\tl\0'

      expect(Log::Extractor.player_name(row)).to eq('Isgalamido')
    end
  end

  describe '.kill_info' do
    it 'extracts kill information from the row when killer' do
      row = '20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT'

      expect(Log::Extractor.kill_info(row)).to eq(['<world>', 'Isgalamido', 'MOD_TRIGGER_HURT'])
    end
  end
end
