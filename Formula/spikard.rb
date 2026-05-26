# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.6"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "671e7d1e56410c2de06f547b4ae38681903ce98c02b6c380ec448a1d240bd8b7"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "11a53c2e302954600f6be7bed720de59635c2605c286dd53212566db9ff301af"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "aa6015094fa3625342d0c5a725cf100ae39df81efe9613c970d2463726b8f897"
    sha256 cellar: :any_skip_relocation, sequoia: "8ec73aeba8e5a1afc3eafb7b3d58e5ea70a052855d66570b19ef2d905085266e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a4f8f08bbab30ccf3c51bd87633de4dd28935ac1a41282aa8929b6cb4841d8bd"
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
