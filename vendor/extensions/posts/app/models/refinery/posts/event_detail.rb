module Refinery
  module Posts
    class EventDetail < Refinery::Core::BaseModel


      validates :location, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
