#!/usr/bin/env bash
set -e
# Directory in which PuppetFile is placed to be scanned by librarian-puppet.
PUPPET_DIR=/vagrant/puppet

echo "Installing Git.."
apt-get -q -y install git

echo "Installing librarian-puppet.."
if [ "$(gem search -i librarian-puppet)" = "false" ]; then
  gem install librarian-puppet -v 1.0.0
fi
echo "librarian-puppet installed!"
echo "Executing PuppetFile.."
cd $PUPPET_DIR && librarian-puppet install --path modules

echo "Installing Puppet repo for Ubuntu 12.04 LTS"
wget -qO /tmp/puppetlabs-release-precise.deb \
        https://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i /tmp/puppetlabs-release-precise.deb
rm /tmp/puppetlabs-release-precise.deb
aptitude update
echo Installing puppet
aptitude install -y puppet
echo "Puppet installed!"
