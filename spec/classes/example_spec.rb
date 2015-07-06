require 'spec_helper'

describe 'module' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "module class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('module::params') }
          it { is_expected.to contain_class('module::install').that_comes_before('module::config') }
          it { is_expected.to contain_class('module::config') }
          it { is_expected.to contain_class('module::service').that_subscribes_to('module::config') }

          it { is_expected.to contain_service('module') }
          it { is_expected.to contain_package('module').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'module class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('module') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
