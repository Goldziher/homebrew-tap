# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.9"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "09aa3dad885dd52bd92f72db979ec8fc0db967a94ad40f5ae2a293a253f5ab63"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.9"
    sha256 cellar: :any_skip_relocation, arm64_linux: "75f7a156a962c190148cebd44f072f57f651ea2466a42dbe01172d9f19bd3cfe"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e2ecf56133f11336482218f88e7c11040d19e4f302f88aab514e6aed34c63fd8"
    sha256 cellar: :any_skip_relocation, sequoia: "57b890171c8f707d75a7a81c4a1639e934c54221fb5eaa9fd39f66f67c806791"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b829a26ff08f17aa395ff0a9a673caf12d14dc5ea3a01536fb486625023da2d9"
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
