#Apache config
default[:apache][:pkgName] = 'httpd'
default[:apache][:dir] = '/etc/httpd'
default[:apache][:group] = 'root'
default[:apache][:user] = 'root'
default[:apache][:confDir] = "#{node[:apache][:dir]}/conf"
default[:apache][:confdDir] = "#{node[:apache][:dir]}/conf.d"
default[:apache][:confFile] = 'httpd.conf'
default[:apache][:servicename] = node[:apache][:pkgName]
default[:apache][:docrootLoc] = '/var/www/html'
default[:apache][:welcomePage] = 'index.html'


#SSL Config
default[:apache][:sslpkgName] = 'mod_ssl'
default[:apache][:sslDir] = '/etc/httpd/ssl'
default[:apache][:sslCertLoc] = node[:apache][:sslDir]
default[:apache][:sslconfFile] = 'ssl.conf'


#Certificate Info
default[:apache][:certCName] = 'node[:fqdn]'
default[:apache][:certOrg] = 'Test Unit'
default[:apache][:certOrgUnit] = 'Test Org'
default[:apache][:certCountry] = 'USA'


# http rediection
default[:apache][:http_to_https] = true
