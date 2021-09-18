# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
  describe '#see_comments_caption' do
    let(:message) { create :post }

    context 'when given post has comments' do
      before { create_list(:comment, 4, post: message) }

      it 'returns See comments and the number of comments' do
        expected_message = "See Comments [ #{message.comments.count} ]"

        expect(see_comments_caption(message)).to eql(expected_message)
      end
    end

    context 'whren given post has no comments' do
      it 'returns No comments yet' do
        expected_message = 'No comments yet'

        expect(see_comments_caption(message)).to eql(expected_message)
      end
    end
  end
end
