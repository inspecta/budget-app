require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  describe 'GET /groups' do
    let(:user) do
      User.create!(
        id: 1,
        name: 'user',
        email: 'user@example.com',
        password: 'password'
      )
    end

    context 'when user has no groups' do
      it "displays 'No groups available'" do
        allow_any_instance_of(GroupsController).to receive(:authenticate_user!).and_return(true)
        visit user_groups_path(user.id)
        expect(page).to have_content('No categories available')
      end
    end
  end
end
