# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.16.1"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "1ca6b65a7143df86aff1e9c8a77a0c47411c12c7bef3c690fb014a78a7f2f6f6"
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
