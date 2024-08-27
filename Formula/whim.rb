class Whim < Formula
    desc "CLI tool to bootstrap and manage Roblox projects"
    homepage "https://github.com/Whimco-Studio/whim-tool"
    url "https://github.com/Whimco-Studio/whim-tool/archive/v1.0.0.tar.gz"
    sha256 "1911329facd72b91774e57959380a7d09cc455b95767aaf7295c29989f33fe6a"
    version "1.0.0"
  
    depends_on "python@3.9"
  
    def install
      bin.install "whim.py" => "whim"
      libexec.install Dir["templates"] # Install the templates directory
      bin.env_script_all_files(libexec/"bin", PYTHONPATH: ENV["PYTHONPATH"] + ":#{libexec}")
    end
  
    test do
      system "#{bin}/whim", "--help"
    end
  end
  