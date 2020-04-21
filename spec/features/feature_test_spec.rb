describe "user stories" do
    
  it "can be locked so the diary can't be viewed" do
    secretDiary = SecretDiary.new
    expect { secretDiary.lock }.not_to raise_error
  end
  
  it "can be unlocked so the diary can be viewed" do
    secretDiary = SecretDiary.new
    expect { secretDiary.unlock }.not_to raise_error
  end
  
end