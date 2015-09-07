import sys
import os
import ctypes

lib_version = '3.17.0'

# Get some info on lib name, depending on platform
loader = ctypes.cdll.LoadLibrary
if sys.platform.startswith('win'):
    libdir = 'Library\\bin'
    fname_base = 'FreeImage'
    ext = '.dll'
    loader = ctypes.windll.LoadLibrary
elif sys.platform.startswith('darwin'):
    libdir = 'lib'
    fname_base = 'libfreeimage'
    ext = '.dylib'
else:
    libdir = 'lib'
    fname_base = 'libfreeimage'
    ext = '.so'

# Get paths to the lib
libnames = []
if not sys.platform.startswith('win'):
    libnames.append(os.path.join(sys.prefix, libdir, fname_base + '-' + lib_version + ext))
libnames.append(os.path.join(sys.prefix, libdir, fname_base + ext))

# Load library and get found version
for fname in libnames:
    print('Testing', fname)
    lib = loader(fname)
    lib.FreeImage_GetVersion.restype = ctypes.c_char_p
    found_version = lib.FreeImage_GetVersion().decode('utf-8')
    assert os.path.isfile(fname), "Could not find file: %s" % fname
    assert lib_version == found_version
    print('Test ok, FreeImage version:', found_version)
