require 'docker'      # see https://rubygems.org/gems/docker-api
require 'serverspec'  # see http://serverspec.org

set :backend, :exec

Excon.defaults[:write_timeout] = 1000
Excon.defaults[:read_timeout] = 1000
