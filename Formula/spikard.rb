# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.10.1.tar.gz"
  sha256 "04011c3dc7430c2af06b5df3776f2c774f03e99df727145b51c72ab9ab314ff9"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"













  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.10.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "24f7ddef8b6e84a16896dbf74d1fd89e9ffa5448d5b1266080f64cd5dd625408"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b0d74e5dfe646ddc8af2e6190dd556a1f8d22a78e1bd5dbbe8c35fb0a8d4096e"
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
