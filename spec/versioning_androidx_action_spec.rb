describe Fastlane::Actions::VersioningAndroidxAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The versioning_androidx plugin is working!")

      Fastlane::Actions::VersioningAndroidxAction.run(nil)
    end
  end
end
