class BitwardenCliBio < Formula
  desc "Bitwarden CLI with biometric unlock (Touch ID, Windows Hello, Linux)"
  homepage "https://github.com/jeanregisser/bitwarden-cli-bio"
  url "https://registry.npmjs.org/bitwarden-cli-bio/-/bitwarden-cli-bio-1.4.3.tgz"
  sha256 "1cfb2d946242637b9c5d181b3a62061e6a8505fa34d8397637d8392cf44da5d6"
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
