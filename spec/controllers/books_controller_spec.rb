require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe '#index' do
    it 'returns successfully' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#show' do
    it 'returns successfully' do
      get :show, id: 1
      expect(response.status).to eq(200)
    end
  end
end
