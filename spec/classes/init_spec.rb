require 'spec_helper'
describe 'iusrepo' do

  context 'with defaults for all parameters' do
    it { should contain_class('iusrepo') }
  end
end
