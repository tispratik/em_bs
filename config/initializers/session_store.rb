# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_em_bs_session',
  :secret      => 'fa7f750b3c8f70c94844afc43f471f512afe00d5bb8619c3f46e8bbbb0ad898130c36207e10af7e4e38602cbd2bd2fbae18d43941bfb5a44ec1dffedd351535b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
