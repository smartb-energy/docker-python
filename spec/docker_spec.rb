# Note: although we require 'docker' here, the gem that satisfies this requirement
# is the 'docker-api' gem (see this project's Gemfile)
require 'docker'
require 'serverspec'

set :backend, :exec

describe "Dockerfile" do
  before(:all) do
    image = Docker::Image.build_from_dir('.')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  describe file('/etc/passwd') do
    it { should be_file }
  end

###################################
#### Add serverspec tests here ####
#### for more inforamtion, see ####
#### http://serverspec.org     ####
###################################

end
