# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.10.2.tar.gz"
  sha256 "d5a6f106628254c45453e4db37f560da1727c6a6f9538c518e4ef1fb2fc84b3f"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"
















  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.10.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "42b98af8bde8e91cd9e84e2f54ddd9c789eabe62708eb5af7a54e5e3ebbd6dc9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3b689f92f906365d96dd4c009f40616a9ff90a99a3c3f5f6c0bbbbe8642c69cd"
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
