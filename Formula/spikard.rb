# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.3"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "1a7e1db3d91bd6246949e20e2a023b38450fc53193ec7c0a23846af2dce68c50"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "53669423a8d76d9c04b9d3b43fc13c84bab82d20a3905dba690384900cf90a1a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "77de4e1eec22e5289b736923fadd6db6d289223a8a35c723f834829dd0bc919d"
    sha256 cellar: :any_skip_relocation, sequoia: "7895a0f3a454079480b108bdb5a19683277fdbfa0892c076b9462b7a1b45ab1f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b087f01d4acc87f56b15eb96f95b6dd271d619b02e6ec2cc8063a56a05c10e63"
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
