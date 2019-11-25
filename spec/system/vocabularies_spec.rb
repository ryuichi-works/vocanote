require 'rails_helper'

describe '単語登録機能', type: :system do
  describe '単語一覧表示' do
    # before do
    #   FactoryBot.create(:vocabulary, word: '最初の単語', meaning: '最初の単語の意味', comment: 'コメント')
    # end

    context '単語を登録するとき' do
      before do
        visit new_vocabulary_path
        fill_in 'Word', with: 'first'
        fill_in 'Meaning', with: '最初の'
        fill_in 'Comment', with: '補足事項'
        click_button '登録'
      end

      it '登録した単語が一覧に表示される' do
        expect(page).to have_content 'first'
      end
    end

    context '一覧画面からの削除機能の確認' do
      before do 
        visit new_vocabulary_path
        fill_in 'Word', with: 'first'
        fill_in 'Meaning', with: '最初の'
        fill_in 'Comment', with: '補足事項'
        click_button '登録'
      end

      it '確認時OKを押したとき' do
        expect(page).to have_link 'first'
        expect(page).to have_link '削除'
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_no_link 'first'
      end
      it '確認時キャンセルを押したとき' do
        expect(page).to have_link 'first'
        expect(page).to have_link '削除'
        click_on '削除'
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_link 'first'
      end
    end
  end
end