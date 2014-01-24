#
# Author:: Carles Muiños (<carles.ml.dev@gmail.com>)
# Cookbook Name:: graphics
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


## Requirements

include_recipe "base"


## Deploy

box = node[:box]
selected = box['apps']['graphics']

if selected
  graphics = data_bag_item('apps', 'graphics')
  apps  = graphics['apps']

  # Uninstall apps not needed
  unselected = apps - selected

  uninstall_apps "graphics" do
    apps unselected
    profiles graphics['profiles']
  end

  # Install selected apps
  node.set[:apps] = { :graphics => graphics }

  include_recipe "graphics::pencil" if selected.include?("pencil")
  include_recipe "graphics::pinta" if selected.include?("pinta")
  include_recipe "graphics::shotwell" if selected.include?("shotwell")
end

