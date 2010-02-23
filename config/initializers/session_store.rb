# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Vip3.0_session',
  :secret      => '983e8c511da0c4201f150471e30f353874afa6bbd26c801c5154758532b3505839015d3f2f954892a20c640c3dcdd89362c55d57b9c1a1091c1c11100d7bba36'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
