#
# Author:: Carles Muiños (<carles.ml.dev@gmail.com>)
# Cookbook Name:: browsers
# Recipe:: default
#
# Copyright 2013,2014 Carles Muiños
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


## Deploy

selected = node[:box][:apps][:browsers]

if selected
  browsers = data_bag_item('apps', 'browsers')
  apps = browsers['apps']

  # Uninstall apps not needed
  unselected = apps - selected

  uninstall_apps "browsers" do
    apps unselected
    profiles browsers['profiles']
  end

  # Install selected apps
  node.default[:apps] = { :browsers => browsers }

  include_recipe "browsers::chrome" if selected.include?("chrome")
  include_recipe "browsers::chromium" if selected.include?("chromium")
  include_recipe "browsers::firefox" if selected.include?("firefox")
  include_recipe "browsers::midori" if selected.include?("midori")
  include_recipe "browsers::opera" if selected.include?("opera")
end

