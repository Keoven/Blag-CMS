# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blag_session',
  :secret      => 'a106a1256f3f620b9e70e7a75970418501a7b234a1f24ff27483cebb62c2e7c30ed2c4620a2ce519fb08070bbada9adf818c3fed2afc35cbdb37440427ed2fec'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
