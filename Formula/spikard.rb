# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.11.0.tar.gz"
  sha256 "19c2eb643ea0b7600af9c838f7d377f3109ea4f17f6fefe06fe7d7c02aab91ce"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"

















  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f6edf0b19f5ab8c4f9a657ff2da1a3af127234b5cdb9a90211b136c30d9ea19f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4e190da0f62683da3327c3786bf6b3278abff2dce6f8c806bf3aae7eb4df93f7"
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
