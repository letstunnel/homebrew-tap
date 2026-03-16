# Homebrew Formula for LetsTunnel CLI
# Install: brew install letstunnel/tap/letstunnel
#
# This file is auto-updated by the release workflow.
# The tap repo is: https://github.com/letstunnel/homebrew-tap

class Letstunnel < Formula
  desc "Expose your localhost to the world — public URLs, .local domains, request inspector"
  homepage "https://letstunnel.com"
  license "MIT"
  version "0.1.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-arm64.tar.gz"
      sha256 "037230bd062788e10583faa05ecfbefb0e09a1c0a3fbd4a59650c958f19b8684"
    elsif Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-darwin-x64.tar.gz"
      sha256 "8b07ae7137991145cc49cc8e8eb369342d902f23a9e8ae69b417b41a93b2a3c0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/letstunnel/letstunnel-releases/releases/download/v#{version}/lt-#{version}-linux-x64.tar.gz"
      sha256 "47f410d03a5e2ee720bfe12c10e4269205066be7e52114da0155e44d1ef0e7fb"
    end
  end

  def install
    bin.install "lt"
  end

  test do
    assert_match "letstunnel", shell_output("#{bin}/lt --version")
  end
end
