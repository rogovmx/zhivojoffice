# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tt111_session',
  :secret      => 'fd89e1bc9d405927f922fbaea00dcf1d5ce08a99ab9932d48eb713c0b6523799e4a49e6bb002832ae95a9bfd5119e082099bb7bb9acb698f9f4fc5e171250a0c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
