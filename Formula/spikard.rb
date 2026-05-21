# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.15.2.tar.gz"
  sha256 "11af4d50461f7b3af73d2729d393094da328a9e878d0cf68f9cfb9bdeeb46ca8"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2c1c0ded17fd0f040ecf28c84279c838486325b7f8ae023daa29ec900301abf5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f7c21ed74eb083ffcc154cc9b0539c1616a1c9510542b3df03389a856885fe67"
    sha256 cellar: :any_skip_relocation, sequoia: "45a07b1afc83c6768c2c19a7f9075aca562ab134806b6164a214f98387c0bbc8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "636fad04ea6289ab6a82fcc88b1f6573e7e48a840ef603f2c45f60f5084d1b41"
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
