# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.1"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.1",
      revision: "b839d5a55d7a5b3071324bbd496e025a54f2f973"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.1"
    sha256 cellar: :any, arm64_linux: "03f9ee6418bc3974a2da50508b860d9de6fc7204f0b40de1f3759499d69f2833"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "787eb45ad25ea03289b46a090b4df0ed925ada600d65e65fc181b40f660bda8d"
    sha256 cellar: :any, x86_64_linux: "2eee36d31f1cb6b16c3654c4dd0c1bd2a0f11459740c403fc92e98d62e1260f1"
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
