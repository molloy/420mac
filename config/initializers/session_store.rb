# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_420mac_session',
  :secret      => 'b906da6aea0293ba4ef0f517be46145e8d4f602b31a0b4cf2f48bacddc8e321fe8a2805db2e72753a249e093184b8d577f459f98e739ad191a665ada6aa53db8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
