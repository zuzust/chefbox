#
# Author:: Carles Muiños (<carles.ml.dev@gmail.com>)
# Cookbook Name:: graphics
# Recipe:: mypaint
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


graphics = node[:apps][:graphics]
mypaint = graphics['profiles']['mypaint']


## PPA Addition

mypaint_ppa = mypaint['source']['data']

core_ppa mypaint_ppa['repo_name'] do
  uri mypaint_ppa['uri']
  distribution node[:lsb][:codename]
  action :add
end


## Deploy

# Paint program for use with graphics tablets
package mypaint['package']

# Suggested packages
mypaint['suggested'].each do |pkg|
  package pkg
end

