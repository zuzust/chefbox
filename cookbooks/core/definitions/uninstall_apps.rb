#
# Author:: Carles Muiños (<carles.ml.dev@gmail.com>)
# Cookbook Name:: core
# Definitions:: uninstall_apps
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


define :uninstall_apps, :autoremove => true do
  apps = params[:apps]
  profiles = params[:profiles]

  apps.each do |app|
    uninstall_app app do
      profile profiles[app]
    end
  end

  if params[:autoremove]
    execute "apt-get -y autoremove" do
      not_if { apps.empty? }
    end
  end
end

