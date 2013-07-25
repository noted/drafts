require 'spec_helper'

describe NoteCreate do
  let(:user) { create :user }
  let(:action) do
    NoteCreate.run({
      current_user: user,
      note: {
        title: 'The Cosmos',
        text:  '**Billions upon billions of _stars_.**'
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_an_instance_of Note }
  it { action.result.title.should eql 'The Cosmos' }
end
