#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2019 The Authors, All Rights Reserved.
#
package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  content '<h1>Welcome to Apache</h1>'
end

service 'httpd' do
  action [:enable, :start]
end
