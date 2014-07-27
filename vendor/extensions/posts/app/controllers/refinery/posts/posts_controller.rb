module Refinery
  module Posts
    class PostsController < ::ApplicationController

      before_filter :find_all_posts
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @post in the line below:
        present(@page)
      end

      def show
        @post = Post.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @post in the line below:
        present(@page)
      end

    protected

      def find_all_posts
        @posts = Post.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/posts").first
      end

    end
  end
end