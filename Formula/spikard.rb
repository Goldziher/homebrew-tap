# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.12"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "aff918c161e3e24c4fea3a24d182e94841e9a917963e8146e10e048138d20b29"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.12"
    sha256 cellar: :any, arm64_linux: "3e024d29733f797c6b0f5b0546baaf6e8fb2996bdad3154784df4995672763b2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4d5ff76476572be7ff2cf213dfe868f1d6d63dd0fe922155d2111edaa5be3890"
    sha256 cellar: :any_skip_relocation, sequoia: "e160ce4d7a223956576652c1245b31a9cd5cbf7153816f40c80da903dd336d5d"
    sha256 cellar: :any, x86_64_linux: "f040f5caabaa66925e942c1e5689bc438609738bf6785f049dfdcdc4de4bc72c"
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
