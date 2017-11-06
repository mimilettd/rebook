require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    provider: "google",
      uid: "12345678910",
      info: {
        email: "mimi@mountainmantechnologies.com",
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now,
      },
      extra: {
        raw_info: {
          name: "Mimi Le" }
      }
  })
end

feature "User can signin" do
  scenario "without Oauth" do
    User.create(name: "Mimi Le", email: "mimi@rebook.com", password: "password")
    visit '/'

    click_on "Sign In"

    expect(current_path).to eq('/signin')

    fill_in "user[email]", with: "mimi@rebook.com"
    fill_in "user[password]", with: "password"

    click_button "Sign in"

    expect(current_path).to eq('/myaccount')
  end

  scenario "with Oauth" do

    stub_omniauth

    visit signin_path

    click_link "Log in with Google+"

    expect(current_path).to eq('/myaccount')
  end
end
