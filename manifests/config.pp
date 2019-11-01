# @summary A short summary of the purpose of this class
#
# A wrapper class for the template that creates the config.xml file
#
# @example
#   include midserver::config
class midserver::config (
  String $servicenow_url,
  String $mid_username,
  String $mid_password,
  String $midserver_name,
){

  file { '/servicenow/midserver/agent/config.xml':
    ensure  => 'present',
    content => epp('midserver/config.xml.epp',{
        servicenow_url => $servicenow_url, # line 26
        mid_username   => $mid_username, # line 37
        mid_password   => $mid_password, # line 100
        midserver_name => $midserver_name, # line 101
    }),
  }

}
