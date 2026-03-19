# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.13.0.tar.gz"
  sha256 "76727f938d66ef7b1d55d4f1cb57f4151f6a44ee39fafc042ea9a34dc0fda58a"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"





















  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a50af8839228d64d7a27823548b2fda41fa4dff1673c9e92f4b8f17e44ab28a7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fd28a264e3ec0867e2b4181f480143f3b7fa65318d0bcf1a8eff2a6e84cd0c26"
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
