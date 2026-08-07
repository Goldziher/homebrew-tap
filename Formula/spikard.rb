# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0-rc.11"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0-rc.11",
      revision: "1cef47c2f5cd789282b747068e6d24cfd7bb066c"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0-rc.11"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "89875bcc73e881d9b867e9fd1ee64c29ff77112bce5ba3e6070d1fb89789ef68"
    sha256 cellar: :any,                 arm64_linux:   "5de9a11a7dda891da3ee0f67c9c3e75c57a69ae502f7c76993573e02407d052d"
    sha256 cellar: :any,                 x86_64_linux:  "bfa124824bdf7562dbca82f93de4832abf35d45808accebad396b9202f5f3a3e"
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
