cask "valhalla" do
  version "2.5.0"
  sha256 "393a92c77b02625c539b233be471a2fb3e93eb1ff43b7f9f8956f77dde72323e"

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