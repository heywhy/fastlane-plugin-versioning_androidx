require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class VersioningAndroidxHelper
      # class methods that you define here become available in your action
      # as `Helper::VersioningAndroidxHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the versioning_androidx plugin helper!")
      end
    end
  end
end
