# Changelog
All notable changes to this project will be documented in this file. Changelogs for versions prior to 6.0.0 are hosted in a different repository.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [6.0.0] - 2022-12-15

### Added
Included a CONTRIBUTIONS.md detailing how to contribute to the prject
Allow hiding individual ribbon sections in the settings
Macro to emphasize first letter of each word of selection, like "United States"
Ability to set an exception color while standardizing highlighting

### Changed
Combined Mac & PC code bases
Updated window arranger to work on Mac and with different dock positions
Reordered ribbon to put important functions on the left to help with ribbon sections collapsing on small screen
Restyled VBA userforms to a more modern look and feel
Rebuilt the VTub to be cross-platform
Update check is now semver compatible
Streamlined setup wizard on first start

### Removed
Removed Email feature, superceded by Tabroom sharing functionality
Removed backfile converter because nobody uses old formats anymore
Removed deprecated functions from the Ribbon
Removed custom mouse icons from PC userforms because they're not compatible on Mac
Removed all Win32 API declarations, now only support 64-bit
Removed old PaDS functions since the service is retired
Removed integrations with the old caselist

### Fixed
Updated the WPM chart in the settings to reflect current speed averages
Insert Header macro now pulls the correct names from the settings
Bug in stripping "Speech" with auto save feature when file named Speech.docx
Bug with duplicate path separators on auto saving
Bug with speech doc names at 12PM or 12AM

### Security
Rebuilt the installers to not disable macro security by default
Removed troubleshooting functions that disable macro security or modify the registry