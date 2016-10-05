require 'rails_helper'

RSpec.describe Topic, type: :model do
   
   describe "attributes" do
    it { should have_db_column(:title).of_type(:string) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
