module Refinery
  module Posts
    class NewsItem < Refinery::Posts::Post
      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]
    end
  end
end
