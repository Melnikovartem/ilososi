{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_ilososi (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/hi_melnikov/Documents/Haskell/ilososi/.stack-work/install/x86_64-linux-nix/lts-8.21/8.0.2/bin"
libdir     = "/home/hi_melnikov/Documents/Haskell/ilososi/.stack-work/install/x86_64-linux-nix/lts-8.21/8.0.2/lib/x86_64-linux-ghc-8.0.2/ilososi-0.1.0.0-H8pDWkvh9nDHjF63Dt2jwj"
dynlibdir  = "/home/hi_melnikov/Documents/Haskell/ilososi/.stack-work/install/x86_64-linux-nix/lts-8.21/8.0.2/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/hi_melnikov/Documents/Haskell/ilososi/.stack-work/install/x86_64-linux-nix/lts-8.21/8.0.2/share/x86_64-linux-ghc-8.0.2/ilososi-0.1.0.0"
libexecdir = "/home/hi_melnikov/Documents/Haskell/ilososi/.stack-work/install/x86_64-linux-nix/lts-8.21/8.0.2/libexec"
sysconfdir = "/home/hi_melnikov/Documents/Haskell/ilososi/.stack-work/install/x86_64-linux-nix/lts-8.21/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ilososi_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ilososi_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ilososi_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ilososi_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ilososi_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ilososi_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
