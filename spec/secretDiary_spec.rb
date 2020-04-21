require "secretDiary"

describe SecretDiary do
  subject(:secretDiary) { described_class.new }
  
  it "can be locked" do
    expect(secretDiary).to respond_to(:lock)
  end
  
  it "can be unlocked" do
    expect(secretDiary).to respond_to(:unlock)
  end
  
  it "can accept new entries" do
    expect(secretDiary).to respond_to(:add_entry).with(1).argument
  end
  
  it "can show all entries" do
    expect(secretDiary).to respond_to(:get_entries)
  end
  
  describe "#open?" do
    it "is initially not open" do
      expect(secretDiary).not_to be_open
    end
  end
  
  describe "#add_entry" do
    it "throws error when diary is locked" do
      new_entry = double :new_entry
      expect { secretDiary.add_entry(new_entry) }.to raise_error "Cannot add: secret diary is locked"
    end
  end
  
end