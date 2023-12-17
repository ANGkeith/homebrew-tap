require 'formula'

class Stderred < Formula
  homepage 'https://github.com/ku1ik/stderred'
  url 'https://github.com/ku1ik/stderred.git',
    using :git,
    revision: "d383f71d349cb34e332b1d4f7e3442f50346813a"
  depends_on 'cmake'

  def install
    mkdir 'build' do
      system 'cmake', "-DCMAKE_INSTALL_PREFIX=#{prefix}", '../src'
      system 'make', 'install'
    end
  end

  def caveats; <<~EOS
      To use stderred export the following before running a command
          export DYLD_INSERT_LIBRARIES="#{HOMEBREW_PREFIX}/lib/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:DYLD_INSERT_LIBRARIES}"
    EOS
  end
end
