# core Cookbook

This cookbook includes core components to be used as a foundation for other cookbooks.  
The following recipes apply:

- `core::default` - includes helper modules.

It is inspired by [opscode-cookbooks/apt](https://github.com/opscode-cookbooks/apt) cookbook
by  

Joshua Timberman (&lt;joshua at opscode.com&gt;)  
Matt Ray (&lt;matt at opscode.com&gt;)  
Seth Chisamore (&lt;schisamo at opscode.com&gt;)


## Requirements

This cookbook applies to the following platforms:  
- `CrunchBang 11+`
- `Linux Mint 13+`
- `Ubuntu 14.04+`

#### cookbooks
- `apt`


## Attributes

#### core::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:box]</tt></td>
    <td>Hash</td>
    <td>profile data of the target node</td>
    <td><tt>{}</tt></td>
  </tr>
  <tr>
    <td><tt>[:apt][:sources_path]</tt></td>
    <td>String</td>
    <td>path to additional package repositories</td>
    <td><tt>/etc/apt/sources.list.d</tt></td>
  </tr>
  <tr>
    <td><tt>[:chef_report][:recipient]</tt></td>
    <td>String</td>
    <td>email address where chef-run reports will be send</td>
    <td><tt>chefbox.coderebels@gmail.com</tt></td>
  </tr>
</table>


## Definitions

### Installing applications

`install_app` provides an easy way to manage the installation of an application,
ensuring the correct addition of external sources when nedeed.

#### Examples

    # install gimp application
    graphics = data_bag_item('apps', 'graphics')

    install_app "gimp" do
      profile graphics['profiles']['gimp']
    end

### Uninstalling applications

`uninstall_app` provides an easy way to uninstall an application,
purging all unnecessary packages.

#### Examples

    # uninstall gimp application
    graphics = data_bag_item('apps', 'graphics')

    uninstall_app "gimp" do
      profile graphics['profiles']['gimp']
    end

`uninstall_apps` provides an easy way to uninstall a set of applications,
purging all unnecessary packages.

#### Examples

    # uninstall graphics applications
    graphics = data_bag_item('apps', 'graphics')

    apps = graphics['apps']
    selected = node[:box][:apps][:graphics]
    unselected = apps - selected

    uninstall_apps "graphics" do
      apps unselected
      profiles graphics['profiles']
    end

### Autostart of applications

`autostart_app` provides an easy way to tell an application to autostart at login time.

#### Examples

    # autostart caffeine indicator
    indicators = data_bag_item('apps', 'indicators')

    autostart_app "screensaver" do
      profile indicators['profiles']['screensaver']
    end

### Creation of directories

`directory_tree` provides an easy way to create directories in a path recursively, applying same owner, group and mode.

#### Examples

    # dotfiles folder creation
    directory_tree "#{ENV['HOME']}/admin/dotfiles" do
      exclude ENV['HOME']
      owner username
      group groupname
      mode 00755
    end

### Delivery of support material

`support` delivers support material about specified subject.

#### Examples

    # delivery of support material about firewall
    support "firewall" do
      section "security"
    end

### Custom launcher creation

`launcher` provides a custom launcher for specified app.

#### Examples

    # custom launcher for backup-mgr script from template
    launcher "backup-mgr" do
      template "/jobs/backup/backup-mgr.desktop.erb"
      variables(
        :backup_script => backup_script
      )
    end

    # custom launcher for backup-mgr script from file
    launcher "backup-mgr" do
      file "/jobs/backup/backup-mgr.desktop"
    end

### Custom uninstaller creation

`uninstaller` provides a custom uninstaller script for specified app.

#### Examples

    # custom uninstaller for QCAD app
    uninstaller "qcad" do
      template "/qcad/uninstall_qcad-es.sh.erb"
      variables(
        :app     => "qcad",
        :website => qcad_website
      )
    end


## Resources/Providers

### Managing repositories

This LWRP provides an easy way to manage additional PPA repositories.
Adding a new repository will notify running the `execute[synchronize_package_index]`
resource immediately.

#### Actions

- :add:    creates a repository file and builds the repository listing
- :remove: removes the repository file

#### Attribute Parameters

- repo_name:    the name of the new source file
- uri:          the ppa uri to add
- distribution: this is usually your release's codename
- cache_build:  triggers package index synchronization (defaults true)
- clean_saved:  triggers sources backup removal (defaults true)

#### Examples

    # add the nitrux-umd repo
    core_ppa "kokoto-java-omgubuntu-stuff" do
      uri "ppa:kokoto-java/omgubuntu-stuff"
      distribution "precise"
    end


## Libraries

### module Coderebels::Chefbox::App

Provides app related functions.

#### Functions

- `app_available`     - checks if an app is available to be installed on the target os and release.
- `app_package_name`  - retrieves the package name of an app from its profile.
- `app_source`        - retrieves the source data of an app from its profile.
- `App.default`       - checks if an app is installed out-of-the-box on the target os and release.

### module Coderebels::Chefbox::Box

Provides box related functions.

#### Functions

- `memory`            - retrieves the total amount of memory of the box.
- `device`            - retrieves the vendor:device string of the device of the specified category.
- `vendor`            - retrieves the vendor of the device of the specified category.
- `platform`          - retrieves the os of the box.
- `platform_version`  - retrieves the os version.
- `platform_codename` - retrieves the code name of the currently installed distribution.
- `platform_arch`     - retrieves the processor type (i686 / x86_64).
- `platform_desktop`  - retrieves the default platform desktop.
- `virtual_box?`      - checks if target box is virtual.

### module Coderebels::Chefbox::Digest

Provides digest related functions.

#### Functions

- `sha256sum` - prints SHA256 checksum of a given file.
- `md5sum`    - prints MD5 checksum of a given file.
- `shadow`    - shadows plain text passwords.

### module Coderebels::Chefbox::Shell

Provides shell related functions.

#### Functions

- `rep` - evaluates shell commands.


## Contact

By Email:   carles.ml.dev at gmail dot com  
On Twitter: [@zuzudev](https://twitter.com/zuzudev)  
On Google+: [Carles Muiños](https://plus.google.com/109480759201585988691)


## License

Copyright (c) 2013,2014 Carles Muiños

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

