# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Posts" do
    describe "Admin" do
      describe "posts" do
        refinery_login_with :refinery_user

        describe "posts list" do
          before do
            FactoryGirl.create(:post, :type => "UniqueTitleOne")
            FactoryGirl.create(:post, :type => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.posts_admin_posts_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.posts_admin_posts_path

            click_link "Add New Post"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Type", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Posts::Post.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Type can't be blank")
              Refinery::Posts::Post.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:post, :type => "UniqueTitle") }

            it "should fail" do
              visit refinery.posts_admin_posts_path

              click_link "Add New Post"

              fill_in "Type", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Posts::Post.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:post, :type => "A type") }

          it "should succeed" do
            visit refinery.posts_admin_posts_path

            within ".actions" do
              click_link "Edit this post"
            end

            fill_in "Type", :with => "A different type"
            click_button "Save"

            page.should have_content("'A different type' was successfully updated.")
            page.should have_no_content("A type")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:post, :type => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.posts_admin_posts_path

            click_link "Remove this post forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Posts::Post.count.should == 0
          end
        end

      end
    end
  end
end
