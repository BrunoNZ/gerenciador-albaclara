#!/bin/bash

# Add it to your ".bashrc" file:
# source <PROJECT_DIR>/config/production_secrets.sh

export RAILS_ENV='production'

# Generate it using: $ rake secret
export SECRET_KEY_BASE=''

# Add this Admin user to your system/database using: $ rake db:seed
export ADMIN_EMAIL=''
export ADMIN_PASSWORD=''

# This must be a valid GMail account
export EMAIL_PROVIDER_USERNAME=''
export EMAIL_PROVIDER_PASSWORD=''

# Create a new PSQL User using: "./scripts/create_psql_user.sh" 
export DATABASE_USERNAME=''
export DATABASE_PASSWORD=''
