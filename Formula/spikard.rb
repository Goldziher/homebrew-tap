# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.10.0.tar.gz"
  sha256 "7df8175e386371593be1a1115ad3f269050396c1e9133a34de91acdebdec0e5f"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"










  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e084004715520c24ff23713067259025a20adbbb92780382e0699aa0da9909b2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "976edf886e98718480c55d743e60d3449e3b8f9f123acafa212d8e292ab04eea"
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
