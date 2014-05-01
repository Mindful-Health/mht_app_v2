require 'spec_helper'

describe "Static Pages" do
	subject {page}

	shared_examples_for "all static pages" do
		it { should have_title(full_title(page_title)) }
	end

	describe "Home page" do
	end

	describe "About page" do
	end

	describe "Contact page" do
	end

end

