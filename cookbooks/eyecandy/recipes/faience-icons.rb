#
# Author:: Carles Muiños (<carles.ml.dev@gmail.com>)
# Cookbook Name:: eyecandy
# Recipe:: faience-icons
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


eyecandy = node[:apps][:eyecandy]

# Faience icon theme
install_app "faience-icons" do
  profile eyecandy['profiles']['faience-icons']
end
