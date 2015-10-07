require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should have default fields' do
              user = FactoryGirl.build(:user)
              expect(user.name).to eq "Test User"
          end

          it 'should fill in the id when using .build_stubbed()' do
              user = FactoryGirl.build_stubbed(:user)
              expect(user.id).not_to eq nil
          end


          it 'should save to the database when using .create()' do
              user = FactoryGirl.create(:user)
              expect(User.count).to eq(1)
          end

          # it 'should not allow user to create multiple acc with same email' do
          #     user = FactoryGirl.create(:user)
          #     # user2 = FactoryGirl.create(:user2)
          #     expect(User.count).to eq(1)
          # end
end
