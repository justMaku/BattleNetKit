
require "fastlane"

test = Fastlane::Actions::EnsureGitStatusCleanAction.new
test.run()

fail("Xcode project is not in sync with the source code.") unless ensure_git_status_clean

