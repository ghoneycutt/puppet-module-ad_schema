require 'spec_helper'
describe 'ad_schema' do

  context 'with defaults for all parameters' do
    it { should contain_class('ad_schema') }
  end
end
