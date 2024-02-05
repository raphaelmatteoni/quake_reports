# Quake Reports

## Description
This project is a Rails application for Quake match reports.

## Overview
The Quake Reports project is designed to parse Quake game logs and generate comprehensive reports. It leverages a database structure to represent key data collected from the log files.

## Database Entities
- Match: Represents a game match.
- Player: Represents a player in the game.
- MatchPlayer: Represents relation between match and player.
- Kill: Represents a kill made by a player and the cause of death.

## Initial Data
The initial game log is available in the db/seeds/qgames.log file. It is loaded during the setup process.

## Reports
The project provides two types of reports, which can be accessed in both HTML and JSON formats.

### 1. General Game Report
- Route: /matches/general_report or /matches/general_report.json
This route provides a detailed report for each match, including total kills, player details, and kill counts.

### Example JSON Response

´´´json
[
  {
    "match_name": {
      "total_kills": 50,
      "players": ["Player1", "Player2", "Player3"],
      "kills": {
        "Player1": 20,
        "Player2": 15,
        "Player3": 10
      }
    }
  },
  // More matches...
]
´´´

### 2. Death Cause Report
- Route: /matches/death_cause_report or /matches/death_cause_report.json
This route presents a report on deaths grouped by the cause of death for each match.

### Example JSON Response

´´´json
[
  {
    "match_name": {
      "kills_by_means": {}
    }
  },
  {
    "match_name": {
      "kills_by_means": {
        "MOD_ROCKET_SPLASH": 3,
        "MOD_FALLING": 1,
        "MOD_TRIGGER_HURT": 7
      }
    }
  },
  // More matches...
]
´´´

### Project Setup

1. Clone the repository:

´´´sh
git clone https://github.com/raphaelmatteoni/quake_reports.git
cd quake_reports
´´´

2. Start the Docker containers:

´´´sh
docker-compose up --build
´´´

3. Access the application at http://localhost:3000.

## Running Tests
RSpec is used for testing. Run the tests with:

´´´sh
docker-compose run web bundle exec rspec
´´´

## Ruby and Rails Versions
- Ruby 3.2.2
- Rails 7.0.8