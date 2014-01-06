class Api
  require 'rest_client'

  attr_reader :game, :hostname, :action, :params

  def initialize(game)
    @game     = game
    @hostname = game.opponent_url
  end

  def register_game
    @action  = 'register'
    @params = {name: game.user_name, email: game.user_email}.to_json

    response = call_api

    serialize(response)
  end

  def launch_attack(game_id, attack_info, last_attack_status)
    @action  = 'nuke'
    @params = {id: game_id, status: last_attack_status, x: attack_info[:x], y: attack_info[:y]}.to_json

    response = call_api

    serialize(response)
  end

  private

  def serialize(response)
    JSON.parse(response, symbolize_names: true)
  end

  def call_api
    begin
      query_api
    rescue => e
      error(e)
    end
  end

  def query_api
    resource = RestClient::Resource.new( "#{hostname}#{action}", timeout: 60, content_type: :json, accept: :json )
    resource.post( params )
  end

  def error(e)
    log.fatal "Error connecting to API - [#{e.message}]"
  end
end
