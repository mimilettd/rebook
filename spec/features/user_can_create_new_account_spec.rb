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

feature "User can create an account" do
  scenario "without Oauth" do
    visit '/'

    click_on "Sign In"

    expect(current_path).to eq('/signin')

    click_on "Register"

    expect(current_path).to eq('/newaccount')

    fill_in "Your name", with: "Mimi Le"
    fill_in "Email", with: "mimi@rebook.com"
    fill_in "Password", with: "password"
    fill_in "Re-enter password", with: "password"

    click_on "Sign Up"

    expect(current_path).to eq('/myaccount')
  end
  scenario "with Google Oauth" do
    stub_omniauth

    visit newaccount_path

    click_link "gmail"

    expect(current_path).to eq('/myaccount')
  end
end
