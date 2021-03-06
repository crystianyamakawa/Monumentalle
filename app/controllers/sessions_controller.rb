class SessionsController < ApplicationController
  def create

    puts "entrou sessions"
    #What data comes back from OmniAuth?
    @auth = request.env["omniauth.auth"]
    puts "omniauth.auth "
    #Use the token from the data to request a list of calendars
    @token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},
      :headers => {'Content-Type' => 'application/json'})
  end
end
