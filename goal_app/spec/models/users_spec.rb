require 'rails_helper'

RSpec.describe User, type: :model do
    # subject(:user) do
    #     FactoryBot.build(:user, 
    #     username: "vegeta",
    #     password: "bulma")
    # end
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    # it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(5)}
  
    describe "uniqueness" do
        before :each do
            create(:user)
        end
        it {should validate_uniqueness_of(:username)}
        it {should validate_uniqueness_of(:session_token)}

    end

end