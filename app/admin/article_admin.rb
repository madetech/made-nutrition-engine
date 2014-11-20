if defined?(ActiveAdmin) and Nutrition.config.engine_active_admin
  ActiveAdmin.register Nutrition.config.article_class, { sort_order: :order } do
    actions :all, except: [:show]

    controller do
      cache_sweeper Nutrition.config.article_sweeper if Nutrition.config.article_sweeper
      defaults finder: :find_by_url
    end

    filter :title

    menu label: 'Article', parent: 'Nutrition', priority: 1

    index do
      column :title
      column :created_at
      column :updated_at
      column :text do |article|
        article.text[0, 100]
      end
      column :lead_image do |article|
        unless article.lead_image.blank?
          image_tag article.lead_image(:thumb)
        end
      end
      column :published do |article|
        if article.published
          'Yes'
        else
          'No'
        end
      end
      column :category

      default_actions
    end

    form do |f|
      f.inputs 'Article' do
        f.input :title
        f.input :page_title
        f.input :text
        f.input :category
        f.input :order
        f.input :published
        f.input :lead_image, as: :file

        f.has_many :related_links do |f_link|
          f_link.inputs do
            f_link.input :title
            f_link.input :text
            f_link.input :url, input_html: { placeholder: 'http://www.example.com' }
            f_link.input :order
            f_link.input :image, as: :file
          end
        end
      end

      f.actions
    end
  end
end
