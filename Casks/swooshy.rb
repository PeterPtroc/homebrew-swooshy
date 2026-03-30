cask "swooshy" do
  version "2.2.3"
  sha256 "11b5c8effc5419088d30ea760afb632f37705ed6c867f2013ebdd4fe44d29747"

  url "https://github.com/PeterPtroc/Swooshy/releases/download/2.2.3/Swooshy-macOS-2.2.3.zip",
      verified: "github.com/PeterPtroc/Sweeesh/"
  name "Swooshy"
  desc "Open-source macOS touchpad-first window utility"
  homepage "https://github.com/PeterPtroc/Sweeesh"

  depends_on macos: ">= :sonoma"

  app "Swooshy.app"

  # reset accessibility records after install/upgrade.
  postflight do
    # tccutil exits non-zero when there is no existing record yet.
    system_command "/bin/sh",
                   args: ["-c", "tccutil reset Accessibility \"$1\" >/dev/null 2>&1 || true", "_", "com.xiamiyu123.swooshy"],
                   sudo: false
  end

  uninstall_postflight do
    system_command "/bin/sh",
                   args: ["-c", "tccutil reset Accessibility \"$1\" >/dev/null 2>&1 || true", "_", "com.xiamiyu123.swooshy"],
                   sudo: false
  end
end
