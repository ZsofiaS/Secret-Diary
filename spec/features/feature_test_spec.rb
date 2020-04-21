describe "user stories" do
  it "so the diary can't be viewed, I can lock the diary" do
    secretDiary = SecretDiary.new
    expect { secretDiary.lock }.not_to raise_error
  end
end