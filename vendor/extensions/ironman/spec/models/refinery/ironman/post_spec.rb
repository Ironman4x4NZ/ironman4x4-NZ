require 'spec_helper'

module Refinery
  module Ironman
    describe Post do
      describe "validations" do
        subject do
          FactoryGirl.create(:post,
          :title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end
    end
  end
end
