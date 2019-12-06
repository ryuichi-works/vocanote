require 'rails_helper'

describe 'ユーザー関連のテスト', type: :system do 
  describe 'ユーザーの新規登録機能' do
    context '新規登録' do
     
      it '入力して新規登録する' do
        visit new_user_path
        fill_in 'Name', with: 'first'
        fill_in 'Email', with: 'example@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password', with: 'password'
        click_button '登録'
        expect(User.find_by(name: 'first').present?).to eq(true)
        expect(page).to have_content 'ユーザー詳細'
      end
    end

    # context 'ログインする' do
    #   before do 
    #     user = FactoryBot.create(:user, name: 'second', email: 'second@example.com', password: 'password')
    #   end

    #   it 'ログイン' do
    #     visit login_path
    #     fill_in 'メールアドレス', with: 'second@example.com'
    #     fill_in 'パスワード', with: 'password'
    #     click_button 'ログインする'
    #     expect(current_path).to eq vocabularies_path(user)
    #   end
    # end
  end

  describe 'ユーザーログイン機能' do
    context 'ユーザーログイン' do
      before do 
        @user = FactoryBot.create(:user, name: 'second', email: 'second@example.com', password: 'password')
      end

      it 'ログイン' do
        visit login_path
        fill_in 'メールアドレス', with: 'second@example.com'
        fill_in 'パスワード', with: 'password'
        click_on 'ログインする'
        # expect(current_path).to eq vocabularies_path
        expect(page).to have_link '単語登録'
        # expect(session[:user_id] == @user.id).to eq(true)
      end
    end
  end
end