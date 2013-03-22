#
# Author:: Carles Muiños (<carles.ml.dev@gmail.com>)
# Cookbook Name:: fileshare
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
fileshare = data_bag_item('apps', 'fileshare')

# Uninstall apps not needed

apps = fileshare['apps']
selected = box['apps']['fileshare']
unselected = apps - selected

uninstall_apps "fileshare" do
  apps unselected
  profiles fileshare['profiles']
end

# Install selected apps

node.set[:apps] = { :fileshare => fileshare }

include_recipe "fileshare::jdownloader" if selected.include?("jdownloader")
include_recipe "fileshare::transmission" if selected.include?("transmission")
