class doffmpeg (

  # class arguments
  # ---------------
  # setup defaults

  $user = 'web',

  # end of class arguments
  # ----------------------
  # begin class

) {

  # setup RPMFusion repo
  exec { 'doffmpeg-rpmfusion-repo' :
    path => '/bin:/usr/bin:/sbin:/usr/sbin',
    command => 'yum localinstall -y --nogpgcheck http://download1.rpmfusion.org/free/el/updates/6/i386/rpmfusion-free-release-6-1.noarch.rpm http://download1.rpmfusion.org/nonfree/el/updates/6/i386/rpmfusion-nonfree-release-6-1.noarch.rpm',
  }
  
  # install ffmpeg package
  if ! defined(Package['ffmpeg']) {
    package { 'ffmpeg' :
      ensure => present,
      require => [Exec['doffmpeg-rpmfusion-repo']],
    }
  }
}
