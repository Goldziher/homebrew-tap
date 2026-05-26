# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.6"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "671e7d1e56410c2de06f547b4ae38681903ce98c02b6c380ec448a1d240bd8b7"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "b6f9fedcb05d84a3a387a98ace89abbedf881822cc818948c9800b719d22f8fe"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "561cbdd5ddd0e7b760790f08e93be683231a5e007148669153c600e9a3c023fe"
    sha256 cellar: :any_skip_relocation, sequoia: "660408d2ab5d3b318a2d17f10329051002348bce57b8360291844358385d90d7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "599ac81d9e7967a59f3d6b11ac7e5c4758a3403a92b173fbe663011f2006a0ec"
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
