require 'stringex'

module Nutrition
  class Article < ActiveRecord::Base
    attr_accessible :text,
                    :url,
                    :page_title,
                    :title,
                    :lead_image,
                    :related_links_attributes,
                    :created_at,
                    :updated_at,
                    :published,
                    :category_id,
                    :order

    has_attached_file :lead_image, styles: Nutrition.config.image_styles

    has_many :related_links
    belongs_to :category
    accepts_nested_attributes_for :related_links, allow_destroy: true

    acts_as_url :title

    default_scope order: '`order` ASC'

    validates_uniqueness_of :url

    def to_param
      url
    end

    def to_s
      title
    end

    def self.paginated(category, page)
      where(category_id: category.id, published: true).page(page).per(Nutrition.config.per_page)
    end
  end
end
