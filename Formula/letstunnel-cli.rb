# Homebrew Formula for LetsTunnel CLI
# Install: brew tap letstunnel/tap && brew install letstunnel-cli
# Or:      brew install letstunnel/tap/letstunnel-cli
#
# This file is auto-updated by the release workflow.
# The tap repo is: https://github.com/letstunnel/homebrew-tap

class LetstunnelCli < Formula
  desc "Expose your localhost to the world — public URLs, .local domains, request inspector"
  homepage "https://letstunnel.com"
  license "MIT"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-arm64.tar.gz"
      sha256 "0bac69572a65804627b0bdecf0340d446fd0c0f18eb9ef7b826395278c88f38d"
    elsif Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-x64.tar.gz"
      sha256 "2e76b87d51e380de33fd2fefdecd6de2b52e8a37e8f88f89fcccab8533f727be"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-linux-x64.tar.gz"
      sha256 "cf80f3b7c1a45b586aea766e82a662d7f059bb6ed2c51a412828c9501f31b6eb"
    end
  end

  def install
    bin.install "lt"
  end

  test do
    assert_match "letstunnel", shell_output("#{bin}/lt --version")
  end
end
