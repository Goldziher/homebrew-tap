# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.7"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "0c030d4f45209507d1eea05c9cb86cb2cecd998b02153acfe3c022f0f4f47dc0"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ce3a0406839e78bab12c6674f682dd567e2cd1a0de632df2035a767b88984399"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9d1054f0026542ff5203f50bf38fd0e445ede69a38af6a21a7a362033674c090"
    sha256 cellar: :any_skip_relocation, sequoia: "efa6aa4ee75aa8effe7aea67a444ffddeec780af7b53a29a59aa0eaa5075ca83"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "82760f248a120fbc56c5504d58d4254fc5a2ee98ebd30730c27a82025eb6121a"
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
