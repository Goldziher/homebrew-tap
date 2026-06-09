# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.21"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "497bcc34c9b8a8a166066b19a97e7bb7c54d38d9422c22c3ba8e50b3741a4334"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.21"
    sha256 cellar: :any, arm64_linux: "525adef419395b849b83a7a1ed99a2dbe14114ae8716a2e47355095b476df1e8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "84a85f52817475060fdeba77ddec1226eaa8114f6954d115b3d4749f43d949c2"
    sha256 cellar: :any_skip_relocation, sequoia: "76e330bb564734bcb71380014977cb427cf1904581673b85b4f635855682a73c"
    sha256 cellar: :any, x86_64_linux: "265d3010aa0804e364ae15d2de60d5362ef70e3691b4ae0d1a3f4713406c4b08"
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
