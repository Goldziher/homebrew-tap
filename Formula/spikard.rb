# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0-rc.10"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0-rc.10",
      revision: "8d48e5d569d76922b505c7616743b90f09cd6bc9"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0-rc.10"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d8348732de3ca378a92215e3abafba2eda008d771dc73267f17a95ae5fee2ce9"
    sha256 cellar: :any,                 arm64_linux:   "7aaaffa92c5b1bdd7887f3510eae3f17502b9703a9f2959fdf93aa11c517941a"
    sha256 cellar: :any,                 x86_64_linux:  "81834c6a39b6add106151ecdf5973bdc50a7d020c53143e8dc7651f585cc66b3"
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
