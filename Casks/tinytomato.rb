cask "tinytomato" do
  version "1.0.0"
  sha256 "2dee595d157e5eea24ecf4b5aa6d13d5fedbafb8a874c0bb17ba589e018ee575"

  url "https://github.com/federicosandrelli/tinytomato/releases/download/v#{version}/tinytomato-#{version}.zip"
  name "tinytomato"
  desc "Minimal pomodoro timer for the macOS menu bar"
  homepage "https://github.com/federicosandrelli/tinytomato"

  depends_on macos: :monterey

  app "tinytomato.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/tinytomato.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.federicosandrelli.tinytomato.plist",
  ]
end
