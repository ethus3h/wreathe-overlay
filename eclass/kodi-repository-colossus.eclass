# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit kodi-plugin

# Original Author: ethus3h
# extend kodi-plugin eclass

colossus_commit="6b49b1d0569910ba4a3fe05e03c08dc56a4ec852"

SRC_URI="https://github.com/Colossal1/repository.colossus/blob/${colossus_commit}/${addonName}/${addonName}-${PV}.zip?raw=true -> ${addonName}-${PV}.zip"
