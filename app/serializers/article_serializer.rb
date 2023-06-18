class ArticleSerializer < ActiveModel::Serializer
  attributes :slug, :title, :description, :body
end
