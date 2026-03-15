# Homebrew Cask for LetsTunnel Desktop App
# Install: brew install --cask letstunnel/tap/letstunnel-app
#
# This file is auto-updated by the release workflow.
# The tap repo is: https://github.com/letstunnel/homebrew-tap

cask "letstunnel-app" do
  version :latest
  sha256 :no_check

  if Hardware::CPU.arm?
    url "https://github.com/letstunnel/letstunnel-releases/releases/latest/download/LetsTunnel_aarch64.dmg"
  else
    url "https://github.com/letstunnel/letstunnel-releases/releases/latest/download/LetsTunnel_x64.dmg"
  end

  name "LetsTunnel"
  desc "Local development tunneling — public URLs, .local domains, request inspector"
  homepage "https://letstunnel.com"

  depends_on macos: ">= :ventura"

  app "LetsTunnel.app"

  zap trash: [
    "~/Library/Application Support/com.letstunnel.app",
    "~/Library/Caches/com.letstunnel.app",
    "~/Library/Preferences/com.letstunnel.app.plist",
    "~/Library/Logs/com.letstunnel.app",
  ]
end
