cask "tinytomato" do
  version "1.1.0"
  sha256 "bcebfc1ffd3a2e56a46a4b738f686b89e8d1168bacc252c7606908922f183ee3"

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
