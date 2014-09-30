require 'rails_helper'

RSpec.describe "UserPages", :type => :request do
  describe "GET /user_pages" do
    it "Sign Up page exists" do
	get signup_path
	expect(response).to have_http_status(200)
	end
  end
end
 
 describe "User pages" do

	let(:base_title) { "USMA CS450" }
	
  describe "Signup page" do
	let (:user) { FactoryGirl.create(:user) }
	before { visit signup_path }

	let(:submit) { "Create my account" }
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
	before {visit signup_path}
	end
	end
	end
	 describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end 

	it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
	end
  end
end

require 'spec_helper'

describe "Authentication" do

	describe "signin" do

    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end 
  subject { page }

  describe "signin page" do
    before { visit signin_path }

describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
end 
end 
