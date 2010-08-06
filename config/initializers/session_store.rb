# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_presalesbom_session',
  :secret      => '6ac18de55704759258f760b54ed914245f0bffb0232e7c5cfcb29222f0b8e9a8b53391f70ae138ece8231a09d7b04ca2c75f82549dfd48b5c8598cf4dae55d5c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
