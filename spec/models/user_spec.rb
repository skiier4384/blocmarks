require 'rails_helper'

RSpec.describe User, type: :model do
    
  let(:user) { User.create!(name: "Blocmarks User", email: "user@blocmarks.com", password: "password") }
  
  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Blocmarks User", email: "user@blocmarks.com")
    end
  end
  
  describe "associations" do
    it { should have_many(:topics) }
  end
end
