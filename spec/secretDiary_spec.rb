require "secretDiary"

describe SecretDiary do
  subject(:secretDiary) { described_class.new }
  
  it "can be locked" do
    expect(secretDiary).to respond_to(:lock)
  end
end