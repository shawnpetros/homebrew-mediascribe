class Mediascribe < Formula
  include Language::Python::Virtualenv
  
  desc "TUI-first tool for transcribing, translating, and analyzing audio/video media"
  homepage "https://github.com/shawnpetros/mediascribe"
  url "https://pypi.io/packages/source/m/mediascribe/mediascribe-0.1.0.tar.gz"
  sha256 "5b956b419f55eae4a6f626109e2600b01128db560509d39257128d7afe00ed56"
  license "MIT"
  head "https://github.com/shawnpetros/mediascribe.git", branch: "main"
  
  depends_on "python@3.12"
  depends_on "ffmpeg"
  
  def install
    virtualenv_install_with_resources
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/mediascribe --version")
  end
end
