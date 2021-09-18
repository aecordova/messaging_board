# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create :user }

  describe 'GET /index' do
    context 'when not logged in' do
      before { get posts_path }

      it 'redirects to login page' do
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'when logged in' do
      let(:message) { create :post }

      before do
        sign_in user
        message
        get posts_path
      end

      it 'responds with ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders posts index template' do
        expect(response).to render_template('posts/index')
      end

      it 'contains all posts information' do
        expect(response.body).to include(message.title)
        expect(response.body).to include(message.body)
      end
    end
  end

  describe 'GET /show' do
    context 'when not logged in' do
      let(:message) { create :post }

      before { get post_path(id: message.id) }

      it 'redirects to login page' do
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'when logged in' do
      let(:message) { create :post }

      before do
        sign_in user
        message
        get post_path(id: message.id)
      end

      it 'responds with ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders posts show template' do
        expect(response).to render_template('posts/show')
      end

      it 'contains message information' do
        expect(response.body).to include(message.title)
        expect(response.body).to include(message.body)
      end
    end
  end

  describe 'POST /create' do
    context 'when information is valid' do
      before do
        sign_in(user)
        post(posts_path, params: params, headers: { 'HTTP_REFERER' => 'http://example.com/posts' })
      end

      let(:params) do
        {
          post: {
            title: 'some title',
            body: 'some body'
          }
        }
      end

      it 'creates a new post' do
        expect(user.posts.count).to be(1)
      end

      it 'redirects back to referrer' do
        expect(response).to redirect_to 'http://example.com/posts'
      end

      it 'displays flash message' do
        expect(flash[:success]).to be_present
        expect(flash[:success]).to eq('Message Created Successfully')
      end
    end

    context 'when information is not valid' do
      before do
        sign_in(user)
        post(posts_path, params: params, headers: { 'HTTP_REFERER' => 'http://example.com/posts' })
      end

      let(:invalid_title) { ('i' * 300).to_s }

      let(:params) do
        {
          post: {
            title: invalid_title,
            body: 'some body'
          }
        }
      end

      it 'doesnt create a new post' do
        expect(user.posts.count).to be(0)
      end

      it 'redirects back to referrer' do
        expect(response).to redirect_to 'http://example.com/posts'
      end

      it 'displays flash message' do
        expect(flash[:error]).to be_present
        expect(flash[:error]).to eq("Can't save because Title is too long (maximum is 255 characters)")
      end
    end
  end
end
