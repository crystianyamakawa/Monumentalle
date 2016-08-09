class TestController < ApplicationController
  layout = false
  def calendar
    @event = {
  'summary' => 'New Event Title',
  'description' => 'The description',
  'location' => 'Location',
  'start' => { 'dateTime' => Chronic.parse('tomorrow 4 pm') },
  'end' => { 'dateTime' => Chronic.parse('tomorrow 5pm') },
  'attendees' => [ { "email" => 'bob@example.com' },
  { "email" =>'sally@example.com' } ] }

client = Google::APIClient.new
client.authorization.access_token = current_user.token
service = client.discovered_api('calendar', 'v3')

@set_event = client.execute(:api_method => service.events.insert,
                        :parameters => {'calendarId' => "monumentalle@gmail.com", 'sendNotifications' => true},
                        :body => JSON.dump(@event),
                        :headers => {'Content-Type' => 'application/json'})

  end

end
