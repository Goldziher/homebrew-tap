# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.16"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "70dfa7989b2a34ef9934dc19b07904af85d4db664dbd337fbcce7d2f7e9f9395"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.16"
    sha256 cellar: :any, arm64_linux: "f5a4b0e0b7c296b4948c45ad0c9cf2135bb1e7cd7873524e5b56d2838d144e97"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ac3606f4620004fd59e4aee7f889c861f133c1c79b6d14d617dd9dcd4124e11a"
    sha256 cellar: :any_skip_relocation, sequoia: "45b4b40fbc1903dcf6b7755750d2429d302edc877926290e2ff64e64b4ed3415"
    sha256 cellar: :any, x86_64_linux: "490a13f875091e97b868a2e51a80fe74241eb347ca5e959bf68e15e40356ca74"
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
