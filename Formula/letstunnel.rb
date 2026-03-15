# Homebrew Formula for LetsTunnel CLI
# Install: brew install letstunnel/tap/letstunnel
#
# This file is auto-updated by the release workflow.
# The tap repo is: https://github.com/letstunnel/homebrew-tap

class Letstunnel < Formula
  desc "Expose your localhost to the world — public URLs, .local domains, request inspector"
  homepage "https://letstunnel.com"
  license "MIT"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-arm64.tar.gz"
      sha256 "ac98bb745680d9562a5b5645b3aa4fac9f0fac622fc414b295c0114430de8470"
    elsif Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-x64.tar.gz"
      sha256 "3295330ab11fa2cb9bc45f37f9843e038f9350cce629af3decd2964f192afe80"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-linux-x64.tar.gz"
      sha256 "616526a505cb2e04cf117a206905c9d45a99225b79a4557db11f4a942ee168f4"
    end
  end

  def install
    bin.install "lt"
  end

  test do
    assert_match "letstunnel", shell_output("#{bin}/lt --version")
  end
end
