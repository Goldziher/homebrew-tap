# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.16.0"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "78994bf33161f007b6be8563aa28ab5d7952e0ef142eae544d7d806b2c99a195"
  license "MIT"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/spikard-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spikard --version")
  end
end
