class must-have {
	include apt

	#handle java installation and license accepting
	# copied from https://bitbucket.org/durdn/stash-vagrant-install/src/892d7e1f5250/manifests/default.pp?at=master
	apt::ppa { "ppa:webupd8team/java": }

	exec { 'apt-get update':
	  command => '/usr/bin/apt-get update',
	  before => Apt::Ppa["ppa:webupd8team/java"],
	}

	exec { 'apt-get update 2':
	  command => '/usr/bin/apt-get update',
	  require => [ Apt::Ppa["ppa:webupd8team/java"], Package["git-core"] ],
	}

	package { ["vim",
	           "curl",
	           "git-core",
	           "zsh",
	           "wget"]:
	  ensure => present,
	  require => Exec["apt-get update"],
	  before => Apt::Ppa["ppa:webupd8team/java"],
	}

	package { ["oracle-java7-installer"]:
	  ensure => present,
	  require => Exec["apt-get update 2"],
	}

	exec {
	  "accept_license":
	  command => "echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections",
	  cwd => "/home/vagrant",
	  user => "vagrant",
	  path    => "/usr/bin/:/bin/",
	  before => Package["oracle-java7-installer"],
	  logoutput => true,
	}

	#handle jmeter downloading and extracting
	#todo - use $version to make things dynamic
	exec {
		"download_jmeter":
		command => "wget http://www.bizdirusa.com/mirrors/apache//jmeter/binaries/apache-jmeter-2.9.tgz | tar zx",
		cwd => "/vagrant",
		user => "vagrant",
		path => "/usr/bin/:/bin",
		require => Exec["accept_license"],
		logoutput => true,
		creates => "/vagrant/jmeter-2.9"
	}

}