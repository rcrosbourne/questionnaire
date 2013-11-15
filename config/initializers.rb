#This file contains all the paths that should be loaded
require 'mongoid'
require File.expand_path("../../lib/questionnaire_api.rb", __FILE__)
require File.expand_path("../../lib/resources/user.rb", __FILE__)
Mongoid.load!(File.expand_path("../../config/mongoid.yml", __FILE__))