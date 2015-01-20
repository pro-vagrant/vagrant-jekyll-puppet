exec { 'apt-get update':
    command => '/usr/bin/apt-get update -y'
}

package { 'nodejs':
    require => Exec['apt-get update']
}

package { 'lynx-cur':
    require => Exec['apt-get update']
}

exec { 'GPG key':
    command => '/usr/bin/gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3',
    require => Exec['apt-get update']
}

exec { 'Install RVM with Ruby':
    command => '/usr/bin/curl -sSL https://get.rvm.io | /bin/bash -s stable --ruby',
    timeout => 6000,
    require => Exec['GPG key']
}

exec { 'Install Jekyll':
    command => '/bin/bash --login -c "gem install jekyll"',
    require => Exec['Install RVM with Ruby']
}
