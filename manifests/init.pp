# Public: Install postgis via homebrew
#
# Examples
#
#   include postgis
class postgis {
  include homebrew

  $version = '2.1.0-boxen1'

  homebrew::formula { 'postgis':
    before => Package['boxen/brews/postgis'],
  }

  package { "numpy":
    ensure => present,
    provider => pip,
    require => Class['python']
  }

  package { 'boxen/brews/postgis':
    ensure => $version,
    require => [Package['boxen/brews/postgresql'], Package['numpy']]
  }
}
