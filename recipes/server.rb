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
  content "<h1>Welcome to Apache</h1>
		<br>
    <h2>#{node['ipaddress']}</h2>
    <h2>#{node['hostname']}</h2>
    "
  action :create  
end

service 'httpd' do
  action [:enable, :start]
end
