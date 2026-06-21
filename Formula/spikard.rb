# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.16.0-rc.3"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "d293d033d833beef0d2c070d2d1da134d206b229c42ccdd2056f3ebf6b69705c"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.16.0-rc.3"
    sha256 cellar: :any, arm64_linux: "769321773de8959aca4c943e2f2d6af73940911096b86bcecaef57a47cafb48d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ca5319b5c82db2279a89a047b623e5a6e39ea16e1347de8e5bd96c765b1d2bf7"
    sha256 cellar: :any, x86_64_linux: "34b09ba3e98670c8789306909b6f5c1b65bd980dba3d42916bf3968a069a6fab"
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
