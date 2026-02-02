class BitwardenCliBio < Formula
  desc "Bitwarden CLI with biometric unlock (Touch ID, Windows Hello, Linux)"
  homepage "https://github.com/jeanregisser/bitwarden-cli-bio"
  url "https://registry.npmjs.org/bitwarden-cli-bio/-/bitwarden-cli-bio-1.3.0.tgz"
  sha256 "375831e79e3c6533e5ee8c0ae7531a26bf2b614c47e1dcd8f488180094a8eac1"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bwbio --bwbio-version")
  end
end
