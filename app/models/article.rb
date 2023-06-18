class Article < ApplicationRecord
    before_save :set_slug

    def set_slug
      self.slug=title.to_s.parameterize
    end
end

