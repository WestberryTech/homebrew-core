class Wb32DfuUpdaterCli < Formula
  desc "USB programmer"
  homepage "https://github.com/WestberryTech/wb32-dfu-updater"
  url "https://github.com/WestberryTech/wb32-dfu-updater/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "de8352d106c06cb4acd962dfa38437917358bec43c78fdad25920ce849739461"
  license "Apache-2.0"
  head "https://github.com/WestberryTech/wb32-dfu-updater.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    args = std_cmake_args

    libusb = Formula["libusb"]
    args << "-DLIBUSB_INCLUDE_DIRS=#{libusb.opt_include}/libusb-1.0"
    args << "-DLIBUSB_LIBRARIES=#{libusb.opt_lib}/#{shared_library("libusb-1.0")}"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end

  test do
    system bin/"wb32-dfu-updater_cli", "-V"
  end
end
