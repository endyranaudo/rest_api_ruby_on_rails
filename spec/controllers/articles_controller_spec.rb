require 'rails_helper'

describe ArticlesController do
  # Test for the #index method - instance method
  describe '#index' do
    subject { get :index }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      # "create_list :article, 2" is a helper from FactoryBot to create multiple instances
      # we added the 'gem active_model_serializers' to have unique instances - see 'spec/factories/articles.rb'
      create_list :article, 2
      subject
      Article.recent.each.with_index do |article, index|
        # json and json_data have been extracted in 'spec/support/json_api_helpers.rb'
        # Made globally available un-commenting line 23 and addding line 41 in 'spec/rails_helper.rb'
        expect(json_data[index]['attributes']).to eq({
          "title" => article.title,
          "content" => article.content,
          "slug" => article.slug,
        })
      end
    end

    it 'should return latest article' do
      # "create :article" is a helper from FactoryBot
      old_article = create :article
      new_article = create :article
      subject
      expect(json_data.first['id']).to eq(new_article.id.to_s)
      expect(json_data.last['id']).to eq(old_article.id.to_s)
    end
  end
end