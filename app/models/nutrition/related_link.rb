module Nutrition
  class RelatedLink < ActiveRecord::Base
    belongs_to :article

    attr_accessible :title,
                    :text,
                    :url,
                    :image,
                    :order,
                    :article_id

    has_attached_file :image, styles: Nutrition.config.image_styles
  end
end
