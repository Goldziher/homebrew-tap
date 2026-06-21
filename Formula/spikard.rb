# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.16.0-rc.3"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "d293d033d833beef0d2c070d2d1da134d206b229c42ccdd2056f3ebf6b69705c"
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
