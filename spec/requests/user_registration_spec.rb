require 'spec_helper'

describe "user registration" do
	let(:submit) { "Sign up" }
	describe "with invalid information" do
		visit "/users/sign_up"
		expect { click sumbit }.not_to change(User, :count)
	end
end
