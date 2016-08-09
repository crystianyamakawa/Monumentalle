Rails.application.config.middleware.use OmniAuth::Builder do

  provider :google_oauth2, '1019637120727-2r0tm0enpuf73nmk0e7bc5rgl8fu9mhk.apps.googleusercontent.com',
  'MCuU_GyKTR2icByQXFYY_Zuz', {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
    redirect_uri:'http://localhost/auth/google_oauth2/callback'
  }
  
end
