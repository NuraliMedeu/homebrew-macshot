cask "macshot" do
  version "4.2.1"
  sha256 "13a2001d975d42a90c57fb9a3fdb54ffc1c26259fde07e48b86fce9e49a2e66d"

  url "https://github.com/sw33tLie/macshot/releases/download/v#{version}/MacShot.dmg"
  name "macshot"
  desc "Native macOS screenshot tool inspired by Flameshot"
  homepage "https://github.com/sw33tLie/macshot"

  depends_on :macos

  app "macshot.app"

  postflight_steps do
    run "/usr/bin/mdimport", args: ["-i", "{{appdir}}/macshot.app"]
    run "/usr/bin/open", args: ["{{appdir}}/macshot.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.sw33tlie.macshot",
    "~/Library/Preferences/com.sw33tlie.macshot.macshot.plist",
  ]
end
