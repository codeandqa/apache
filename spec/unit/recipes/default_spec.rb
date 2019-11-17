#
# Cookbook Name:: apache
# Spec:: default
#
# Copyright (c) 2019 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new({:platform => 'Centos', :version => '7.2'})
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'install correct httpd package' do
      expect(chef_run).to install_package('httpd')
    end


    # it 'create a default html file template' do
    #   expect(chef_run).to create_template("/var/www/html/index.html")
    # end

    it 'start the http service correctly' do
      expect(chef_run).to start_service('httpd')
    end

    it 'enable the http service correctly' do
      expect(chef_run).to enable_service('httpd')
    end
  end
end
