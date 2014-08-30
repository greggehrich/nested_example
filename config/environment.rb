# Load the Rails application.
require File.expand_path('../application', __FILE__)

APP_CONFIG = YAML.load_file("#{Rails.root}/config/application_config.yml")[Rails.env]

# Initialize the Rails application.
DevArcadenomadCom::Application.initialize!

