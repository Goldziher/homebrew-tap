# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0-rc.7"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0-rc.7",
      revision: "364d7489ff49f4af0c6f6afea0e647ec5dc97e63"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0-rc.7"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "25fd10d204badfa75f8ab53881256d155361cfd7edafb61f81589a2f4cde0b11"
    sha256 cellar: :any,                 arm64_linux:   "eb23b79dd6cfb1bc02c9535ce0ae9506ba20692b421965a10cd913f554eafd1e"
    sha256 cellar: :any,                 x86_64_linux:  "6b0f2c44edf46fe8ec021d07be0d945dfb0c45b4aa1376b797b26ab1c3a165a9"
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
