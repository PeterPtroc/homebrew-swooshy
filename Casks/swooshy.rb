cask "swooshy" do
  version "2.2.2"
  sha256 "f42db059f9ed07b81a11ccb2489ec2a1634a412ecfffc8957568106d8228b2bf"

  url "https://github.com/PeterPtroc/Swooshy/releases/download/2.2.2/Swooshy-macOS-2.2.2.zip",
      verified: "github.com/PeterPtroc/Sweeesh/"
  name "Swooshy"
  desc "Open-source macOS touchpad-first window utility"
  homepage "https://github.com/PeterPtroc/Sweeesh"

  depends_on macos: ">= :sonoma"

  app "Swooshy.app"

  # Reset stale Accessibility TCC records after install/upgrade.
  postflight do
    system_command "tccutil",
                   args: ["reset", "Accessibility", "com.xiamiyu123.swooshy"],
                   sudo: false
  end

  # Remove records after uninstall.
  uninstall_postflight do
    system_command "tccutil",
                   args: ["reset", "Accessibility", "com.xiamiyu123.swooshy"],
                   sudo: false
  end
end
