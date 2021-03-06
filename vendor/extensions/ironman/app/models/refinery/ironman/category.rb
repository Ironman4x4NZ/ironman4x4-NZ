module Refinery
  module Ironman
    class Category < Refinery::Core::BaseModel
      extend FriendlyId

      friendly_id :name, use: :slugged
      acts_as_tree name_column: 'name', order: 'refinery_ironman_categories.sort_order', touch: true
      acts_as_indexed :fields => [:name, :description, :short_description]

      PRODUCT_INDEX_TEMPLATES = ['inherit', 'product-grid', 'product-list', 'product-list-condensed']

      has_and_belongs_to_many :products, :join_table => 'refinery_ironman_categories_products', :dependent => :destroy
      belongs_to :thumbnail_image, :class_name => '::Refinery::Image'
      has_many :specifications, :class_name => '::Refinery::Ironman::ProductSpecification'

      validates_presence_of :name
      validates_uniqueness_of :name, scope: :parent_id
      validates_inclusion_of :product_index_template, :in => PRODUCT_INDEX_TEMPLATES, :allow_blank => true

      scope :active, -> { where(visible: true) }
      scope :featured, -> { where(featured: true) }
      scope :has_fitting_instructions, -> { where(has_fitting_instructions: true) }
      scope :show_in_products, -> { where(show_in_products: true) }
      scope :homepage_categories, -> { where(show_on_homepage: true) }

      accepts_nested_attributes_for :specifications, :allow_destroy => true

      alias_attribute :title, :name

      after_initialize do
        if self.new_record?
          self.visible = false if self.visible.nil?
          self.featured = false if self.featured.nil?
          self.show_on_homepage = false if self.show_on_homepage.nil?
          self.show_in_products = true if self.show_in_products.nil?
          self.has_fitting_instructions = true if self.has_fitting_instructions.nil?
          self.thumbnail_display_mode = 'contain' if self.thumbnail_display_mode.nil?
        end

        if self.product_index_template.nil?
          if root?
            self.product_index_template = 'product-grid'
          else
            self.product_index_template = 'inherit'
          end
        end
      end

      def active?
        visible
      end

      def visible?
        visible
      end

      def featured?
        featured
      end

      def show_on_homepage?
        show_on_homepage
      end

      def has_fitting_instructions?
        has_fitting_instructions
      end

      def show_in_products?
        show_in_products
      end

      def is_hero_subcategory?
        is_hero_subcategory
      end

      def images_with_captions
        @images_with_captions = image_pages.map do |ref|
          {
            image: Refinery::Image.find(ref.image_id),
            caption: ref.caption || ''
          }
        end
      end
    end
  end
end
