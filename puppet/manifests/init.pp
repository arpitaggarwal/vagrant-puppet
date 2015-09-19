Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
include java8
include tomcat
class { 'apache':  }
class {'::mongodb::server':
  port    => 27018,
  verbose => true,
}
