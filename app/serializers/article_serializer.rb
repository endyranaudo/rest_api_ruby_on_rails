# frozen_string_literal: true

class ApplicationSerializer
  include FastJsonapi::ObjectSerializer
end

class ArticleSerializer < ApplicationSerializer
  attributes :title, :content, :slug
end
