# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.9.2.tar.gz"
  sha256 "811cf5a701e492241fe172c2ec913d6dc44043db6ff36bd9ef30c015536e3965"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"







  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.9.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c04b2f2dce99911ec69ec2a33cf65623ce6b11a728eb5d43a9988fd009521042"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9c934f94060635cd6beaac64d8ee5ae71bba87560c9aa7fa24f3a9a8e77a7158"
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
