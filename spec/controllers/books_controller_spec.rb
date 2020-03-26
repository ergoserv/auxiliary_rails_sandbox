require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let!(:publisher) { create(:publisher) }
  let!(:book) { create(:book, publisher: publisher) }

  describe 'GET #index' do
    subject { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the book' do
      subject

      expect(assigns(:books)).to include(book)
    end

    it 'expected render the template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns the book' do
      subject

      expect(assigns(:book)).not_to be_nil
    end

    it 'expected render the template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    let(:book_attributes) { attributes_for(:book, :with_publisher_name) }
    let(:params) { { book: book_attributes } }

    it 'creates a new content_object' do
      expect { subject }.to change(Book, :count).by 1
    end

    it 'redirects to the created content_object' do
      subject

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to books_path
    end
  end
end
