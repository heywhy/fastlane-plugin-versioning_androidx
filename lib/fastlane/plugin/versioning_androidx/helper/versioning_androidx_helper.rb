require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class VersioningAndroidxHelper
      VERSION_CODE_RE = /android:versionCode=\"(\d+)\"/
      VERSION_NAME_RE = /android:versionName=\"(\bv?(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)(?:-[\da-z\-]+(?:\.[\da-z\-]+)*)?(?:\+[\da-z\-]+(?:\.[\da-z\-]+)*)?\b)\"/

      # class methods that you define here become available in your action
      # as `Helper::VersioningAndroidxHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the versioning_androidx plugin helper!")
      end
    end
  end
end
