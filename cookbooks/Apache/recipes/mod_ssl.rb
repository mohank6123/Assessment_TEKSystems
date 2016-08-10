#
# Cookbook Name:: apachemohan
# Recipe:: mod_ssl
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package node[:apache][:sslpkgName]

directory node[:apache][:sslDir] do
  owner node[:apache][:user]
  group node[:apache][:group]
  mode 0644
  recursive true
end

openssl_x509 "#{node[:apache][:sslDir]}/#{node[:fqdn]}.pem" do
  common_name "#{node[:apache][:certCName]}"
  org node[:apache][:certOrg]
  org_unit node[:apache][:certOrgUnit]
  country node[:apache][:certCountry]
end

template "#{node[:apache][:confdDir]}/#{node[:apache][:sslconfFile]}" do
  source "#{node[:apache][:sslconfFile]}.erb"
  owner node[:apache][:user]
  group node[:apache][:group]
  mode 0644
  notifies :reload, "service[#{node[:apache][:servicename]}]", :delayed
end