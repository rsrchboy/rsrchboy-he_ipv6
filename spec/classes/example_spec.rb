require 'spec_helper'

describe 'he_ipv6' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "he_ipv6 class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('he_ipv6::params') }
        it { should contain_class('he_ipv6::install').that_comes_before('he_ipv6::config') }
        it { should contain_class('he_ipv6::config') }
        it { should contain_class('he_ipv6::service').that_subscribes_to('he_ipv6::config') }

        it { should contain_service('he_ipv6') }
        it { should contain_package('he_ipv6').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'he_ipv6 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('he_ipv6') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
