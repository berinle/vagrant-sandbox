class jmeterbook {
	include apt
	exec { 'apt-get update' :
		command = '/usr/bin/apt-get update'
	}

	package { ["vim",
	           "curl",
	           "git-core",
	           "zsh",
	           "wget"]:
	  ensure => present,
	  require => Exec["apt-get update"]
	}	

	exec {
		"download_jmeter":
		command => "wget http://www.bizdirusa.com/mirrors/apache//jmeter/binaries/apache-jmeter-2.9.tgz | tar zx",
		cwd => "/vagrant",
		user => "vagrant",
		path => "/usr/bin/:/bin",
		logoutput => true,
		creates => "/vagrant/jmeter-2.9"
	}
}