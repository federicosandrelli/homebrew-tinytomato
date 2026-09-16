cask "tinytomato" do
  version "1.2.0"
  sha256 "28e6b7d2a990165baf5cad208cc1c5f1725b074035e2e1d809d8587d6aac15a8"

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
