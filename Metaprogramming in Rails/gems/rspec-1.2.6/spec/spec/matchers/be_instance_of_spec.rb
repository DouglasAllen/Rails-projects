#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---
require File.dirname(__FILE__) + '/../../spec_helper.rb'

module Spec
  module Matchers
    [:be_an_instance_of, :be_instance_of].each do |method|
      describe "actual.should #{method}(expected)" do
        it "passes if actual is instance of expected class" do
          5.should send(method, Fixnum)
        end

        it "fails if actual is instance of subclass of expected class" do
          lambda { 5.should send(method, Numeric) }.should fail_with(%Q{expected 5 to be an instance of Numeric})
        end

        it "fails with failure message for should unless actual is instance of expected class" do
          lambda { "foo".should send(method, Array) }.should fail_with(%Q{expected "foo" to be an instance of Array})
        end

        it "provides a description" do
          matcher = be_an_instance_of(Fixnum)
          matcher.matches?(Numeric)
          matcher.description.should == "be an instance of Fixnum"
        end
      end
      
      describe "actual.should_not #{method}(expected)" do
        
        it "fails with failure message for should_not if actual is instance of expected class" do
          lambda { "foo".should_not send(method, String) }.should fail_with(%Q{expected "foo" not to be an instance of String})
        end

      end

    end
  end
end
