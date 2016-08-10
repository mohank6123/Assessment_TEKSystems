#
# Cookbook Name:: apachemohan
# Recipe:: apache
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
loaded_recipe = run_context.loaded_recipes
puts "=============="
puts loaded_recipe
puts "=============="

package node[:apache][:pkgName]

template "#{node[:apache][:confDir]}/#{node[:apache][:confFile]}" do
  source "#{node[:apache][:confFile]}.erb"
  owner node[:apache][:user]
  group node[:apache][:group]
  mode 0644
  variables(
    :loaded_recipe => loaded_recipe
  )
  notifies :reload, "service[#{node[:apache][:servicename]}]", :delayed
end

template "#{node[:apache][:docrootLoc]}/#{node[:apache][:welcomePage]}" do
  source "#{node[:apache][:welcomePage]}.erb"
  owner node[:apache][:user]
  group node[:apache][:group]
  mode 0644
  notifies :reload, "service[#{node[:apache][:servicename]}]", :delayed
end

service node[:apache][:servicename] do
  supports [:start, :restart, :reload, :status]
  action [:enable, :start]
end