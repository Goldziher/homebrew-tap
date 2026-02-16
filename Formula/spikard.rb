# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.11.0.tar.gz"
  sha256 "52526d61970bd7665a01996aa0eca61a66afeb3fbd9bec0211000932da41d35c"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"


















  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a5837e0bfbc31713e947532d16c6ba3f70888ebbceb2566c3aa01ef885605dd2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "06f5159cdf67a14dd5871115a763c4f351ecf6db2d29f6fb536046d42d06ff46"
  end

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/spikard-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spikard --version")
  end
end
