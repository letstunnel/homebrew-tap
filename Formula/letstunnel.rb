# Homebrew Formula for LetsTunnel CLI
# Install: brew install letstunnel/tap/letstunnel
#
# This file is auto-updated by the release workflow.
# The tap repo is: https://github.com/letstunnel/homebrew-tap

class Letstunnel < Formula
  desc "Expose your localhost to the world — public URLs, .local domains, request inspector"
  homepage "https://letstunnel.com"
  license "MIT"
  version "0.1.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-arm64.tar.gz"
      sha256 "8fe18082a7c29603e0a1c7c1ddac8d3fd79d5f668cf4941fa17f85c6864c80b3"
    elsif Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-x64.tar.gz"
      sha256 "192aec606df2588bdefb3e2ce292b8b14f312f510592b509620eddee55325f42"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-linux-x64.tar.gz"
      sha256 "7fdccab5abd9dc56f39057a717282c47d0c60cf5d140341896ac61536884151a"
    end
  end

  def install
    bin.install "lt"
  end

  test do
    assert_match "letstunnel", shell_output("#{bin}/lt --version")
  end
end
