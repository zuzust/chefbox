#
# Author:: Carles Muiños (<carles.ml.dev@gmail.com>)
# Cookbook Name:: browsers
# Recipe:: default
#
# Copyright 2013, Carles Muiños
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


## Requirements

include_recipe "base"


## Deploy

box = node[:box]
browsers = data_bag_item('apps', 'browsers')

# Uninstall apps not needed

apps = browsers['apps']
selected = box['apps']['browsers']
unselected = apps - selected

uninstall_apps "browsers" do
  apps unselected
  profiles browsers['profiles']
end

# Install selected apps

node.set[:apps] = { :browsers => browsers }

include_recipe "browsers::chrome" if selected.include?("chrome")
include_recipe "browsers::firefox" if selected.include?("firefox")
include_recipe "browsers::opera" if selected.include?("opera")
