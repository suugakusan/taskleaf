require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
    describe "一覧機能の表示" do
      before do
        user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
        FactoryBot.create(:task, name: '最初のタスク', user: user_a)
      end
      context "ユーザーAが露軍しているとき" do
        before do
          visit login_path
          fill_in 'メールアドレス', with: 'a@example.com'
          fill_in 'パスワード', with: 'password'
          click_button 'ログインする'
        end
        it "ユーザーAが作成したタスクが表示される" do
          expect(page).to have_content '最初のタスク'
        end
      end
    end
end