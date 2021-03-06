module Refinery
  module Ironman
    class MediaRelease < Refinery::Core::BaseModel

      self.table_name = 'refinery_ironman_media_releases'
      acts_as_indexed :fields => [:title, :description, :publication]

      belongs_to :unpriced_resource, :class_name => '::Refinery::Resource'
      belongs_to :priced_resource, :class_name => '::Refinery::Resource'
      belongs_to :thumbnail_image, :class_name => '::Refinery::Image'

      validates_presence_of :title, :description
      validates_uniqueness_of :title
      validates_presence_of :publication, if: 'published_at.present?'
      validates_presence_of :published_at, if: 'publication.present?'

      scope :active, -> { where(draft: false) }

      after_initialize do
        if self.new_record?
          self.draft = true if self.draft.nil?
          self.posted_at = Time.zone.now if self.posted_at.nil?
        end
      end

      def draft?
        draft
      end
    end
  end
end
