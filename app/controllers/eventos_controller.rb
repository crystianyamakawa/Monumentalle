class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]

  require 'google/api_client'

  # GET /eventos
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # # POST /eventos
  # def create
  #   @evento = Evento.new(evento_params)
  #
  #   if @evento.save
  #     redirect_to @evento, notice: 'Evento foi criado com sucesso.'
  #   else
  #     render :new
  #   end
  # end

  # PATCH/PUT /eventos/1
  def update
    if @evento.update(evento_params)
      redirect_to @evento, notice: 'Evento foi alterado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /eventos/1
  def destroy
    @evento.destroy
    redirect_to eventos_url, notice: 'Evento was successfully destroyed.'
  end

  def create
        puts " In Session  controller"
        #What data comes back from OmniAuth?
        @auth = request.env["omniauth.auth"]
        puts "@auth " + @auth.to_s
        #Use the token from the data to request a list of calendars
         @token = @auth["credentials"]["token"]

         puts "2 In Session  controller"
         client = Google::APIClient.new
         client.authorization.access_token = @token
         service = client.discovered_api('calendar', 'v3')
        # puts "3 In Session  controller"
        #
         @result = client.execute(
           :api_method => service.calendar_list.list,
           :parameters => {},
           :headers => {'Content-Type' => 'application/json'})

  end

  def redirect
      google_api_client = Google::APIClient.new({
        application_name: 'Example Ruby application',
        application_version: '1.0.0'
      })

      google_api_client.authorization = Signet::OAuth2::Client.new({
        client_id: '1019637120727-2r0tm0enpuf73nmk0e7bc5rgl8fu9mhk.apps.googleusercontent.com',
        client_secret: 'MCuU_GyKTR2icByQXFYY_Zuz',
        authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
        scope: 'https://www.googleapis.com/auth/calendar.readonly',
        redirect_uri: url_for(:action => :callback)
      })

      authorization_uri = google_api_client.authorization.authorization_uri

      redirect_to authorization_uri.to_s
  end

  def callback
  google_api_client = Google::APIClient.new({
    application_name: 'Example Ruby application',
    application_version: '1.0.0'
  })

  google_api_client.authorization = Signet::OAuth2::Client.new({
    client_id: '1019637120727-2r0tm0enpuf73nmk0e7bc5rgl8fu9mhk.apps.googleusercontent.com',
    client_secret: 'MCuU_GyKTR2icByQXFYY_Zuz',
    token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
    redirect_uri: url_for(:action => :callback),
    code: params[:code]
  })

  response = google_api_client.authorization.fetch_access_token!

  session[:access_token] = response['access_token']

  redirect_to url_for(:action => :google_calendar)
end

##############################################################################
def google_calendar
  google_api_client = Google::APIClient.new({
    application_name: 'Example Ruby application',
    application_version: '1.0.0'
  })

  google_api_client.authorization = Signet::OAuth2::Client.new({
    client_id: '1019637120727-2r0tm0enpuf73nmk0e7bc5rgl8fu9mhk.apps.googleusercontent.com',
    client_secret: 'MCuU_GyKTR2icByQXFYY_Zuz',
    access_token: session[:access_token]
  })

  google_calendar_api = google_api_client.discovered_api('calendar', 'v3')

  response = google_api_client.execute({
    api_method: google_calendar_api.calendar_list.list,
    parameters: {}
  })

  response = google_api_client.execute({
    api_method: google_calendar_api.events.list,
    parameters: {
    :calendarId => 'primary',
    :singleEvents => true,
    :orderBy => 'startTime' }
    })

  @items = response.data['items']

end

#############################################################################
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def evento_params
      params.require(:evento).permit(:dt_evento, :dt_inicio, :dt_termino, :created_by, :update_by, :obs, :tp_evento, :status, :sinc_google, :dt_sinc)
    end
end
