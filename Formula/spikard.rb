# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0-rc.6"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0-rc.6",
      revision: "9a95e871a74c687705e882337a604f8fcb6278a3"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0-rc.6"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a6eef81854473d7758b529c6d4a68c0b5c63f07574f2dbea94c6bbea33bcc1b2"
    sha256 cellar: :any,                 arm64_linux:   "366df1709e97bf4c539dea229add04d26ce5a3accdc22886367fa4783e49f37a"
    sha256 cellar: :any,                 x86_64_linux:  "2ad213e70fd4fb65c5b2f3779af4c2a43035a7c74d2af95bcaa068bd8cabaa4a"
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
