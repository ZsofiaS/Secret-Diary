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
    
    context "when diary is locked" do
      it "throws error when diary is locked" do
        new_entry = double :new_entry
        expect { secretDiary.add_entry(new_entry) }.to raise_error "Cannot add: secret diary is locked"
      end
    end
    
    context "when diary is open" do
      it "can accept new entry" do
        new_entry = double :new_entry
        secretDiary.unlock
        expect(secretDiary.add_entry(new_entry)).to eq([new_entry])
      end
    end
  end
  
  describe "#get_entries" do
      
    context "when diary is locked" do  
      it "throws error when diary is locked" do
        expect { secretDiary.get_entries }.to raise_error "Cannot show entries: secret diary is locked"
      end
    end
    
    context "when diary is open" do
      it "can show the entries" do
        new_entry = double :new_entry  
        secretDiary.unlock
        secretDiary.add_entry(new_entry)
        expect(secretDiary.get_entries).to eq(secretDiary.entries)
      end
    end
  end
  
  
end