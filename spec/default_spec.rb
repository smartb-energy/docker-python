require 'spec_helper'

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
  #
  # after(:all) do
  #   image.remove(:force => true)
  # end

  describe command('python -V') do
    its(:stderr) { should match /Python 2.7/}
    its(:exit_status) { should eq 0 }
  end

  describe command('pip --version') do
    its(:exit_status) { should eq 0 }
  end

  apt_packages = ['gcc', 'python2.7-dev', 'libffi-dev', 'libpng12-dev', 'libfreetype6-dev', 'libblas-dev', 'liblapack-dev', 'libatlas-base-dev', 'gfortran', 'libpq-dev', 'python-pip']
  apt_packages.each do |x|
    describe package(x) do
      it { should be_installed }
    end
  end
end
