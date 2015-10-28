# Note: although we require 'docker' here, the gem that satisfies this requirement
# is the 'docker-api' gem (see this project's Gemfile)
require 'docker'
require 'serverspec'

set :backend, :exec

describe "Dockerfile" do
  before(:all) do
    image = Docker::Image.build_from_dir('.') do |v|
      if (log = JSON.parse(v)) && log.has_key?("stream")
        $stdout.puts log["stream"]
      end
    end

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  describe file ('/home/root/prepare_ubuntu_image.sh') do
    its(:content) { should match /set -e/ }
    its(:content) { should match /apt-get update/ }
    its(:content) { should match /apt-get clean && rm -rf \/var\/lib\/apt\/lists/ }
  end

###################################
#### Add serverspec tests here ####
#### for more inforamtion, see ####
#### http://serverspec.org     ####
###################################

end
