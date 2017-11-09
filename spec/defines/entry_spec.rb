require 'spec_helper'

describe 'etc_profile::entry' do
  let(:title) { 'namevar' }
  let(:params) do
    {
      config: {
        'name' => 'foo',
      },
    }
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to contain_file('etc_profile dir') }
      it { is_expected.to contain_file('etc_profile dir').with({
            path: '/etc/profile.d/foo.sh',
        })
      }
      it { is_expected.to compile }
    end
  end
end
