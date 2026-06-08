# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.11"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "d663a6a721ed532fc59ccf66c733e1cca421ab0d4bccd78106c61145cae6d3a3"
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
