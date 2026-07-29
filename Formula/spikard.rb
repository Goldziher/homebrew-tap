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
    sha256 cellar: :any, arm64_linux: "2c637b786d3127a2990026cf49b72c4917d21cdd1bcf126b6ea2a55b61ad4f76"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e137b71f642fceeb290769ba0fd04594437bed8ece0d28b7f52819f313632367"
    sha256 cellar: :any, x86_64_linux: "361c3df117a5e3072e006b530ac058120e0afde91dfba4d392768f8ca53a357e"
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
