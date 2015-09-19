class tomcat {

	package {"tomcat7":
		ensure => installed
	}

	service {"tomcat7":
		ensure => running,
		enable => true,
		require => Package["tomcat7"]
	}
	
}
