# @summary A short summary of the purpose of this class
#
# Configures and installs a ServiceNow mid server
#
# @example
#   include midserver
class midserver {

  #Make install directory
  file { ['/servicenow','/servicenow/midserver']:
    ensure => directory,
  }

  # unzip package (pre-req for archive module on posix)
  package { 'unzip':
    ensure => 'present',
    before => Archive['/servicenow/midserver/midserver.zip'],
  }

  #Download and extract package (mod 'puppet-archive', '4.3.0')
  archive { '/servicenow/midserver/midserver.zip':
    ensure       => present,
    extract      => true,
    extract_path => '/servicenow/midserver',
    cleanup      => false,
    creates      => '/servicenow/midserver/midserver.zip',
    source       => 'https://install.service-now.com/glide/distribution/builds/package/mid/2019/09/24/mid.newyork-06-26-2019__patch2-09-18-2019_09-24-2019_1701.linux.x86-64.zip',
    require      => File['/servicenow/midserver'],
  }

}
