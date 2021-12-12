class Wb32DfuUpdaterCli < Formula
  desc "USB programmer"
  homepage "https://github.com/WestberryTech/wb32-dfu-updater"
  url "https://github.com/WestberryTech/wb32-dfu-updater/files/7698411/wb32-dfu-updater_cli-v0.0.2-Darwin.tar.gz"
  sha256 "69f13b90c1c4a2ba9fbb042f3d2841c7a2cd4b4234243b417985d62c788ba274"
  license "Apache-2.0"
  head "https://github.com/WestberryTech/wb32-dfu-updater.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    args = std_cmake_args

    libusb = Formula["libusb"]
    args << "-DLIBUSB_INCLUDE_DIRS=#{libusb.opt_include}/libusb-1.0"
    args << "-DLIBUSB_LIBRARIES=#{libusb.opt_lib}/#{shared_library("libusb-1.0")}"
    args << "-DCMAKE_BUILD_TYPE=Release"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end

  test do
    system bin/"wb32-dfu-updater_cli", "-V"
  end
end
