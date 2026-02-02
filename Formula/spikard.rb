# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.10.1.tar.gz"
  sha256 "17e7138750a820128b1bcbc36048208afa26b87659c051c9c63202ad730ea538"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"












  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.10.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4bdc92bf8387fd35f956d4153ab8608a42b4c3c4a12abf5285e09398ba68d8f4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2aaae81ee381f72fbb07a1b721945d78cb826531040ba1f8e6ee4a0b59068758"
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
