class Devhost < Formula
  desc "Per-directory port virtualization for dev servers"
  homepage "https://github.com/wickedev/devhost"
  url "https://github.com/wickedev/devhost/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "071b7b91e878fa4862abe7393234030a29be40a0a1f54686e2a4b4135c39848d"
  license "MIT"
  head "https://github.com/wickedev/devhost.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/devhost"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/devhost version")
  end
end
