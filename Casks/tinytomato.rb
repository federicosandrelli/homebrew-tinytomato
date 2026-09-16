cask "tinytomato" do
  version "1.3.0"
  sha256 "c873e404f4069c0bcd92baae6a9c4c474532b08ead1d132354953ff1b736a448"

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
