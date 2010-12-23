# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_openbook_session',
  :secret      => '0912ad7d83bc1ee3b7df7a3d58981be0b324e3bbccf298e1d13f062730ec3c6e9a79344028e9bb4dd2a00a8484d265c5590b38ce30e25869d83802ac098c6be1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
