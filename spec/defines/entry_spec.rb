require 'spec_helper'

describe 'etc_profile::entry' do
  let(:title) { 'namevar' }
  let(:params) do
    {
      name: 'foo',
      config: {
        'mode' => '1777',
      },
    }
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to contain_file('etc_profile entry foo') }
      it {
        is_expected.to contain_file('etc_profile entry foo').with(
          path: '/etc/profile.d/site/foo.sh',
          mode: '1777',
        )
      }
      it { is_expected.to compile }
    end
  end
end
