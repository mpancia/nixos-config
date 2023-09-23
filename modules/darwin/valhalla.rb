cask "valhalla" do
  # NOTE: "2" is not a version number, but an intrinsic part of the product name
  version "2.5.0"
  sha256 "ec400a6491523e7f782cd574f62918ce42c543c4c0c0da8248c202bc9be03c41"

  url "https://valhallaproduction.s3.us-west-2.amazonaws.com/supermassive/ValhallaSupermassiveOSX_2_5_0.dmg",
      verified: "valhallaproduction.s3.us-west-2.amazonaws.com/supermassive/"
  name "Valhalla Supermassive"
  desc "Massive delay and reverb effect"
  homepage "https://valhalladsp.com/shop/reverb/valhalla-supermassive/"

#   livecheck do
    # url "https://oeksound.com/changelog/soothe2/"
    # regex(/<h3>v?(\d+(?:\.\d+)+)[" <]/i)
#   end

  depends_on macos: ">= :high_sierra"

  pkg "ValhallaSupermassiveOSX_2_5_0.dmg"

  uninstall pkgutil: [
  ]

  zap trash: [
  ]
end