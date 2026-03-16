# Homebrew Formula for LetsTunnel CLI
# Install: brew install letstunnel/tap/letstunnel
#
# This file is auto-updated by the release workflow.
# The tap repo is: https://github.com/letstunnel/homebrew-tap

class Letstunnel < Formula
  desc "Expose your localhost to the world — public URLs, .local domains, request inspector"
  homepage "https://letstunnel.com"
  license "MIT"
  version "0.1.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-arm64.tar.gz"
      sha256 "d8cde68ae5168f3f8c86e53ae3799aab798ee3df3f8303ff308d40b844373b22"
    elsif Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-x64.tar.gz"
      sha256 "ae877311a4e6ad35027b4ea9a2d4cd93a280e4e6efbbc81731121dc0f2d25fa9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-linux-x64.tar.gz"
      sha256 "6ae86935fb7e0f2da6c5fcc273c82c2c0071fa99283c892c52c74ff2f746bb9d"
    end
  end

  def install
    bin.install "lt"
  end

  test do
    assert_match "letstunnel", shell_output("#{bin}/lt --version")
  end
end
