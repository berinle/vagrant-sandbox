include java
#include apt
#include stdlib

package { ["vim",
	           "curl",
	           "git-core",
	           "zsh"]:
	  ensure => present
	  }

exec {
		"set-up-slave-node-1":
		command => "curl -L http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-2.9.tgz | tar zx && mv /home/vagrant/apache-jmeter-2.9 /home/vagrant/jmeter-1",
		creates => "/home/vagrant/jmeter-1",		
		timeout => 0,
		cwd => "/home/vagrant",
		user => "vagrant",
		path => "/usr/bin/:/bin",
		#logoutput => true,		
		require => Package[ "curl" ]
	}

exec {
		"set-up-slave-node-2":
		command => "curl -L http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-2.9.tgz | tar zx && mv /home/vagrant/apache-jmeter-2.9 /home/vagrant/jmeter-2",
		creates => "/home/vagrant/jmeter-2",		
		timeout => 0,
		cwd => "/home/vagrant",
		user => "vagrant",
		path => "/usr/bin/:/bin",
		#logoutput => true,		
		require => Package[ "curl" ]
	}

exec {
		"set-up-slave-node-3":
		command => "curl -L http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-2.9.tgz | tar zx && mv /home/vagrant/apache-jmeter-2.9 /home/vagrant/jmeter-3",
		creates => "/home/vagrant/jmeter-3",		
		timeout => 0,
		cwd => "/home/vagrant",
		user => "vagrant",
		path => "/usr/bin/:/bin",
		#logoutput => true,		
		require => Package[ "curl" ]
	}	