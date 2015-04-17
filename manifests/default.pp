exec { 'apt-get update':
    command => '/usr/bin/apt-get update -y'
}

package { 'nodejs':
    require => Exec['apt-get update']
}

package { 'lynx-cur':
    require => Exec['apt-get update']
}

package { 'ruby1.9.1-dev':
    require => Exec['apt-get update']
}

exec { 'Install Jekyll':
    command => 'gem install jekyll',
    require => Exec['Install RVM with Ruby']
}
