# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.10"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "83ccfb417990c02addb73b9450672be259477ff62db45c29da16c0e3bfaf416b"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.10"
    sha256 cellar: :any, arm64_linux: "429fa972e5bdffe64b907e924b5881b661252295c4e834c64e5a30164f51ad1f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9974fd3d9548e60bac9db40149ae7830531fe274e3bd5cf010058d47de75c104"
    sha256 cellar: :any_skip_relocation, sequoia: "a80801ce9c77ef1cbe6f5d9de60427345fb72cf48f90ea811d9b10b042b15d32"
    sha256 cellar: :any, x86_64_linux: "930bcf5344479ca16309302148ef557ecf416cb892d2d90c99c61afa017c7b66"
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
