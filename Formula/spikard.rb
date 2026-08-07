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
    sha256 cellar: :any, arm64_linux: "23967480ce60693c763dd6c3d0a1fe8105320160191f10450f20febbaeeab8da"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4677187ce507fb582b163fc23166e3c343ca10243123d860c7865165dad72e55"
    sha256 cellar: :any, x86_64_linux: "4fb918089e2ee27f573cc29cb893e0fffb6ce8debfb00a2b5fab009b10bcd097"
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
