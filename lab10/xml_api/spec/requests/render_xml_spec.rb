require 'rails_helper'

RSpec.describe 'RenderXmls', type: :request do
  describe 'GET /' do
    context 'should return' do
      it 'http success' do
        get root_path, params: { n: 15, format: :xml }
        expect(response).to have_http_status(:success)
      end

      it 'xml format' do
        get root_path, params: { n: 45, format: :xml }
        expect(response.headers['Content-Type']).to eq("application/xml; charset=utf-8")
      end

      it 'rss format' do
        get root_path, params: { n: 145, format: :rss }
        expect(response.headers['Content-Type']).to eq("application/rss+xml; charset=utf-8")
      end
    end
  end
end
