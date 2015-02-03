module Refinery
  module Ironman
    class Product < Refinery::Core::BaseModel
      extend FriendlyId

      before_save :touch_categories

      #TODO: find out why history isn't working with friendly_id and refinery
      #friendly_id :name, use: [:slugged, :history]
      friendly_id :name, use: :slugged
      acts_as_indexed :fields => [:product_no, :name, :description, :short_description]

      self.table_name = 'refinery_ironman_products'

      has_and_belongs_to_many :categories, :join_table => 'refinery_ironman_categories_products'
      has_and_belongs_to_many :vehicles, :join_table => 'refinery_ironman_vehicles_products'
      belongs_to :thumbnail_image, :class_name => '::Refinery::Image'
      belongs_to :fitting_instructions_resource, :class_name => '::Refinery::Resource'
      has_many :specifications, :class_name => '::Refinery::Ironman::ProductSpecification'

      alias_attribute :title, :name

      scope :active, -> { where(draft: false) }
      scope :homepage_products, -> { where(show_on_homepage: true) }

      #TODO: turn back on once duplicate product_no's have been sorted
      #validates_uniqueness_of :product_no
      validates_presence_of :product_no, :name, :quantity_required

      accepts_nested_attributes_for :specifications, :allow_destroy => true

      after_initialize do
        if self.new_record?
          self.draft = true if self.draft.nil?
          self.show_on_homepage = false if self.show_on_homepage.nil?
          self.quantity_required = 0 if self.quantity_required.nil?
        end
      end

      def touch_categories
        categories.each(&:touch)
      end

      def category
        categories.first if not categories.empty?
      end

      def vehicle
        vehicles.first if not vehicles.empty?
      end

      def active?
        not draft
      end

      def draft?
        draft
      end

      def show_on_homepage?
        show_on_homepage
      end

      def images_with_captions
        @images_with_captions = image_pages.map do |ref|
          {
            image: Refinery::Image.find(ref.image_id),
            caption: ref.caption || ''
          }
        end
      end

      def specs
        specs = {}

        self.category.specifications.each do |specification|
          specs[specification.title] = specification.value if specification.value.present?
        end

        specs["Quantity Required"] = quantity_required if quantity_required.present? and specs["Quantity Required"].nil?
        self.specifications.each do |specification|
          specs[specification.title] = specification.value if specification.value.present? and specs[specification.title].nil?
        end

        specs
      end

      def thumbnail_display_mode_cached
        # TODO: add caching
        if thumbnail_display_mode.present?
          thumbnail_display_mode
        elsif not categories.empty?
          categories.first.thumbnail_display_mode
        end
      end
    end
  end
end
