# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0-rc.8"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0-rc.8",
      revision: "ee9b249e6688e1dfbbf520bd1b22a92cf3a45735"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0-rc.8"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "437c77d424c787983fb07a33c0396999ffb2500507543af115cf4a4e1424399d"
    sha256 cellar: :any,                 arm64_linux:   "1c6f9b73e66c9441ade837333dc317121e07c5db35bfb61ec1149282f55e9b90"
    sha256 cellar: :any,                 x86_64_linux:  "9e5218ed58d275064eb29f51e1d9e961d25c9deb81cee43891e0d7b35535f511"
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
