require 'spec_helper'
require 'spec_values'

os_values = @os_values

describe 'etc_profile::csh' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it {
        is_expected.to contain_file('etc_profile csh file').with(
          path: os_values[os_facts[:os]['family']][:csh][:file][:path],
        )
        is_expected.to contain_file('etc_profile csh dir').with(
          path: os_values[os_facts[:os]['family']][:csh][:dir][:path],
        )
      }
    end
  end
end
