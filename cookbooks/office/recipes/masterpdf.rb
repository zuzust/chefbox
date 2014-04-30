#
# Author:: Carles Muiños (<carles.ml.dev@gmail.com>)
# Cookbook Name:: office
# Recipe:: masterpdf
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


office = node[:apps][:office]

# Complete solution for view, print and edit PDF and XPS files
masterpdf = office['profiles']['masterpdf']

if app_available? masterpdf
  install_app "masterpdf" do
    force true
    profile masterpdf
  end

  support "masterpdf" do
    section "office"
  end
end

