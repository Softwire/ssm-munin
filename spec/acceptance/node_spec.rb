require 'spec_helper_acceptance'

describe 'munin::node' do
  let(:pp) do
    <<-MANIFEST
    if $facts['os']['family'] == 'RedHat' {
      if $facts['os']['release']['major'] == '8' {
        yumrepo { 'PowerTools':
          enabled => '1',
          before  => Class['munin::node'],
        }
        yumrepo { 'AppStream':
          enabled => '1',
          before  => Class['munin::node'],
        }
      }
      package { 'epel-release':
        ensure => present,
        before => Class['munin::node'],
      }
    }
    include munin::node
    munin::plugin { 'test_link':
      ensure => link
    }
  MANIFEST
  end

  it 'applies the manifest twice with no stderr' do
    idempotent_apply(pp)
  end

  describe package('munin-node') do
    it { is_expected.to be_installed }
  end

  describe service('munin-node') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe file('/etc/munin/plugins/test_link') do
    it { is_expected.to be_symlink }
  end
end
