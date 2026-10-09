# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.2"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.2",
      revision: "065ea81efcc1e1b27357df540515824703ccc8f7"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.2"
    sha256 cellar: :any, arm64_linux: "c72a0769c3fc468de7ddc8d61c7c4608880cf71a4949b9213cd1a0c16b710d3e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1fbee0625af04ea5cd38525d3f7b1d7a58aad195e73bc82b663dbbede4ce47bc"
    sha256 cellar: :any, x86_64_linux: "242951ff869d1039e1d383ada3a87e16e593fd3961c6141864209a77d7300f0e"
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
