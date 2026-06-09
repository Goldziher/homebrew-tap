# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.17"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "e6554f5d0e327e9d08c2ef2e244a49255a922620ca2f59205b97326f122c80f7"
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
