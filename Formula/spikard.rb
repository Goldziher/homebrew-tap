# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.13"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "53b3484d17453e4de6a9f56f03dbd453181d3c35905f9595da098cf33a1f4de6"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.13"
    sha256 cellar: :any, arm64_linux: "06bed400ddab4d5a9dd2071297f1ee59a6076784bb98d11090ad2554228d2f0b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "78312f682bd40d6a9700c7bb992db9674f987b3b7e357e9f18faf761ff885c80"
    sha256 cellar: :any_skip_relocation, sequoia: "e7d0185f8a865f07bc275b566f55affcac6c0a2ac02fea3e635229be8777015d"
    sha256 cellar: :any, x86_64_linux: "8616d320708dffa046832000097e545a0a62d1d23fa40af48766a0d47ad31d3f"
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
