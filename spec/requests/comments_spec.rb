# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) { create :user }
  let(:message) { create :post }

  context 'when information is valid' do
    before do
      message
      sign_in user
      post post_comments_path(post_id: message.id, params: params)
    end

    describe 'POST /create' do
      let(:params) do
        {
          comment: {
            content: 'some body'
          }
        }
      end

      it 'creates a new comment on the given post' do
        expect(message.comments.count).to be(1)
      end

      it 'displays flash message' do
        expect(flash[:success]).to be_present
        expect(flash[:success]).to eq('Comment Added Successfully')
      end
    end

    context 'when information is not valid' do
      let(:invalid_content) { ('i' * 300).to_s }

      let(:params) do
        {
          comment: {
            content: invalid_content
          }
        }
      end

      it 'doesnt create a new post' do
        expect(message.comments.count).to be(0)
      end

      it 'displays flash message' do
        expect(flash[:error]).to be_present
        expect(flash[:error]).to eq("Can't save because Content is too long (maximum is 255 characters)")
      end
    end
  end
end
