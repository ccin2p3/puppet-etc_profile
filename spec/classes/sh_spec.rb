require 'spec_helper'
require 'spec_values'

os_values = @os_values

describe 'etc_profile::sh' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it {
        is_expected.to contain_file('etc_profile sh file').with(
          path: os_values[os_facts[:os]['family']][:sh][:file][:path],
        )
      }
      it {
        is_expected.to contain_file('etc_profile sh dir').with(
          path: os_values[os_facts[:os]['family']][:sh][:dir][:path],
        )
      }
    end
  end
end
