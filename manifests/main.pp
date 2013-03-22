include java
include apt
include stdlib
package { ["vim",
	           "curl",
	           "git-core",
	           "zsh",
	           "wget"]:
	  ensure => present
	  }

#exec {
#		"download_jmeter":
#		command => "wget http://www.bizdirusa.#com/mirrors/apache//jmeter/binaries/apache-jmeter-2.9.tgz -O /usr/local/apache-jmeter-2.9.tgz",
#		creates => "/vagrant/jmeter-2.9",		
#		timeout => 0,
#		cwd => "/vagrant",
#		user => "vagrant",
#		path => "/usr/bin/:/bin",
#		logoutput => true,		
#		require => Package[ "wget" ]
#	}
#
#exec {
#	"extract_jmeter":
#	command => "tar -zxf apache-jmeter-2.9.tgz",
#	cwd => "/usr/local",	
#	unless => "test -d apache-jmeter-2.9",
#    require => Exec["download_jmeter"]
#}
