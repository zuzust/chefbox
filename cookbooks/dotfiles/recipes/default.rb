#
# Cookbook Name:: dotfiles
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

# Displays directory tree, in color
package "tree"

# Graphical tool to diff and merge files
package "meld"

# Search for files within Debian packages (command-line interface)
package "apt-file"

# Lists available package versions with distribution
package "apt-show-versions"


## Deploy

box_profile = Chef::EncryptedDataBagItem.load("boxes", node[:box][:id])

admin_dir = "#{ENV['HOME']}/#{box_profile['admin_folder']}"
dotfiles_dir = "#{admin_dir}/dotfiles"
bash_dotfiles_dir = "#{dotfiles_dir}/bash"

directory dotfiles_dir do
  owner node[:box][:default_user]
  group node[:box][:default_group]
  mode 0755
end

remote_directory bash_dotfiles_dir do
  owner node[:box][:default_user]
  group node[:box][:default_group]
  mode 0755
  files_owner node[:box][:default_user]
  files_group node[:box][:default_group]
  files_mode 0644
  files_backup false
end

template "#{bash_dotfiles_dir}/env" do
  source "/bash/env.erb"
  owner node[:box][:default_user]
  group node[:box][:default_group]
  mode 0644
  backup false
  variables(
    :admin_folder => box_profile['admin_folder']
  )
end

template "#{dotfiles_dir}/bashrc" do
  source "/bash/bashrc.erb"
  owner node[:box][:default_user]
  group node[:box][:default_group]
  mode 0644
  backup false
  variables(
    :admin_folder => box_profile['admin_folder']
  )
end

execute "backup_bashrc_file" do
  cwd ENV['HOME']
  command "mv .bashrc .bashrc.orig"
  user node[:box][:default_user]
  creates "#{ENV['HOME']}/.bashrc.orig"
end

link "#{ENV['HOME']}/.bashrc" do
  to "#{dotfiles_dir}/bashrc"
  owner node[:box][:default_user]
  group node[:box][:default_group]
end

