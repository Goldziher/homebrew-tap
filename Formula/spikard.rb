# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.8.0.tar.gz"
  sha256 "bf86012ffe5de4f29d6a3fd4ace6438fbf79df8b10cab98f08fde555b5424893"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/spikard-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spikard --version")
  end
end
