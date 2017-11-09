require 'spec_helper'

describe 'etc_profile' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_file('etc_profile file') }
      it { is_expected.to contain_file('etc_profile dir') }
    end
  end
end
