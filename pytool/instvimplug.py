#!/usr/bin/env python3

# ****************************************************************************
# DESCRIPTION
#   Staffolding a new vimplug instance inside a new nvim dir
#   at Linux or Windows.
# ****************************************************************************


import logging
import os
import platform
import requests
import sys


DOWNLOAD_URL = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'



def main(download_url):
    init_logging()
    logger = logging.getLogger()

    nvim_dir = get_checked_nvim_dir()
    autoload_dir = get_checked_autoload_dir(nvim_dir)
    assert autoload_dir.endswith('autoload')

    downloaded_file = download_file_to(download_url, autoload_dir)

    logger.info('downloaded to ' + downloaded_file)

    sys.exit(0)


def init_logging():
    logging.basicConfig(level=logging.DEBUG)


def get_checked_nvim_dir():
    logger = logging.getLogger()

    platforms_allowed = ('Linux', 'Windows')
    platform_actual = platform.system()
    logger.debug('detected platform is "%s"' % platform_actual)

    if platform_actual == 'Windows':
        user_profile = os.environ['USERPROFILE']
        appdata_local = os.path.join(user_profile, 'AppData', 'Local')
        nvim_dir = os.path.join(appdata_local, 'nvim')

    elif platform_actual == 'Linux':
        user_home = os.environ['HOME']
        nvim_dir = os.path.join(user_home, '.config', 'nvim')

    else:
        platforms_allowed_str = ', '.join(platforms_allowed)
        raise OSError('OS platform "%s" not expected, allowed: %s.'
                      %(platform_actual, platforms_allowed_str))

    assert os.path.isdir(nvim_dir)
    logger.debug('nvim config dir "%s" does exist' % nvim_dir)

    return nvim_dir


def get_checked_autoload_dir(nvim_dir):
    logger = logging.getLogger()

    dir_nvim_autoload = os.path.join(nvim_dir, 'autoload')
    if os.path.isdir(dir_nvim_autoload):
        logger.debug('autoload dir "%s" does exist' % dir_nvim_autoload)
    else:
        os.mkdir(dir_nvim_autoload)
        assert os.path.isdir(dir_nvim_autoload)
        logger.debug('created missing autoload dir "%s" does exist' % nvim_dir)

    return dir_nvim_autoload


def download_file_to(url, dest_dir):
    logger = logging.getLogger()

    dest_file_basename = os.path.split(url)[-1]
    dest_file = os.path.join(dest_dir, dest_file_basename)
    logger.debug('%s + %s = %s' %(dest_dir, dest_file_basename, dest_file))

    r = requests.get(url, allow_redirects=True)

    with open(dest_file, 'wb') as fh:
        fh.write(r.content)

    logger.debug('downloaded!')

    return dest_file


if __name__ == '__main__':
    main(DOWNLOAD_URL)
