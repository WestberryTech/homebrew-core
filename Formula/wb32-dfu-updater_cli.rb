class Wb32DfuUpdaterCli < Formula
  desc "USB programmer"
  homepage "https://github.com/WestberryTech/wb32-dfu-updater"
  url "https://github.com/WestberryTech/wb32-dfu-updater/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "56f3bfaa6b71db8cdecd776f5f9a3db58632bce060cf921e20f8529e1648d7c8"
  license "Apache-2.0"
  head "https://github.com/WestberryTech/wb32-dfu-updater.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    system "cmake", "-S", "source/wb32-dfu-updater_cli", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin/"wb32-dfu-updater_cli", "-V"
  end
end
