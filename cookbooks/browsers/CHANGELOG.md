# CHANGELOG for browsers

This file is used to list changes made in each version of browsers.

## 0.6.2:

* README.md - ubuntu 12.04 no longer supported

## 0.6.1:

* files/default/env.d/midori.benv - midori browser env variables
* recipes/midori                  - deploy env file into every user's dotfiles env folder

## 0.6.0:

* README.md       - linuxmint 13 no longer supported
* recipes/default - now includes midori browser install management
* recipes/midori  - manage midori browser installation

## 0.5.3:

* README.md - include CrunchBang as target platform

## 0.5.2:

* recipes/chrome - fixes repository duplication issue

## 0.5.1:

* recipes/firefox - check app availability before installation

## 0.5.0:

* README   - update requirements section
* metadata - remove 'core' and 'base' dependencies

* recipes/default

  - do not include recipe[base:default] any more
  - normal attribute 'apps' becomes default attribute
  - use of symbols for attribute keys

* recipes/chromium - do not support Unity Web Apps anymore
* recipes/firefox  - do not support Unity Web Apps anymore

## 0.4.4:

* recipes/chromium - mandatory minor refactorization
* recipes/firefox  - mandatory minor refactorization

## 0.4.3:

* recipes/chrome - rollback changes made in 0.4.1 (unnecessary)

## 0.4.2:

* recipes/chrome   - now uses module Box's new method to retrieve platform code name
* recipes/chromium - now uses module Box's new method to retrieve platform code name
* recipes/firefox  - now uses module Box's new method to retrieve platform code name

## 0.4.1:

* recipes/chrome - fixes repository duplication issue

## 0.4.0:

* recipe/default   - now checks for section presence in box profile's apps list before proceed
* recipes/chromium - minor changes
* recipes/firefox  - minor changes

## 0.3.1:

* recipes/chromium - now supports unity web apps integration on ubuntu platform only
* recipes/firefox  - now supports unity web apps integration on ubuntu platform only

## 0.3.0:

* recipes/default  - now includes chromium browser install management
* recipes/chromium - installs chromium browser and supports unity web apps integration
* recipes/firefox  - now supports unity web apps integration

## 0.2.0:

* recipes/firefox - delivers first steps documentation concerning firefox browser

## 0.1.1:

* recipes/chrome - dryed chrome browser installation using install_app core definition
* recipes/opera  - dryed opera browser installation using install_app core definition

## 0.1.0:

* Initial release of browsers

