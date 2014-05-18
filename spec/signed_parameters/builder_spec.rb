require 'spec_helper'

describe SignedParameters::Builder do
  let(:params) { { :foo => 'foo', :bar => :bar, :baz => '', 'qux' => 42 } }
  let(:secret) { 'some secret token' }
  let(:separator) { ';' }

  let(:sign) { '17223137b3c5f28247367deb3f86dc9d' }

  subject { SignedParameters::Builder.new params, secret, separator }

  describe '#used_parameters' do
    its(:used_parameters) { should == { :foo => 'foo', :bar => :bar, 'qux' => 42 } }
  end

  describe '#sorted_parameters_values' do
    its(:sorted_parameters_values) { should == ['42', 'bar', 'foo'] }
  end

  describe '#string_for_sign' do
    its(:string_for_sign) { should == '42;bar;foo;some secret token' }
  end

  describe '#sign' do
    its(:sign)  { should == sign }
  end

  describe '#parameters_with_sign' do
    its(:parameters_with_sign) { should == { :foo => 'foo', :bar => :bar, 'qux' => 42, :sign => sign } }
  end

  describe '#to_query' do
    its(:to_query) { should == 'bar=bar&foo=foo&qux=42&sign=17223137b3c5f28247367deb3f86dc9d' }
  end
end
