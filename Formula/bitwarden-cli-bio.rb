class BitwardenCliBio < Formula
  desc "Bitwarden CLI with biometric unlock (Touch ID, Windows Hello, Linux)"
  homepage "https://github.com/jeanregisser/bitwarden-cli-bio"
  url "https://registry.npmjs.org/bitwarden-cli-bio/-/bitwarden-cli-bio-1.4.2.tgz"
  sha256 "a3870172adad7cba44c06c3b208228cb2b2d75e7cbac633f61888b54c33c4e26"
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
