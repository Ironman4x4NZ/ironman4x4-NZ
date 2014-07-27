require 'spec_helper'

module Refinery
  module Posts
    describe Post do
      describe "validations" do
        subject do
          FactoryGirl.create(:post,
          :type => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:type) { should == "Refinery CMS" }
      end
    end
  end
end