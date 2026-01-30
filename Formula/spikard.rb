# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.10.0.tar.gz"
  sha256 "d948d1682152ab4584b921367a874d9188d8d753081f10bf5fad6997f847d99c"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"








  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7a1b452c1ba038dba62323ca6cd35cdb9547387e8149f5333f99fe8e39737c03"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "251c5c41816aab2cb1a060f3bcec6c2f0350df8840b2b15089750cd6ff84bf11"
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
