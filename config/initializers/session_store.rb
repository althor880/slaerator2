# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_slaerator2_session',
  :secret      => 'd3c49823d1fc6102f1ed8e426f906cf7bd70dc62c3fd2c19fe94a3b0bd99baa1499e11497351e6d7f603b13ae21611e616343cf261d23860244b2f2a1762c406'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
