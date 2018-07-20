# Go from 0 → usable Mac with minimal effort

:warning: this is just a prototype and is very rough around the edges. The
general flow from unboxing a new Mac is:

0. Plug-in, ensure charged

1. Obtain access to auth seed (see below for more info)

2. Boot, provide Apple ID, etc

3. Sync iCloud (seed)

4. Install Chrome, sign-in

5. Install Apps (handled by setup.sh)

6. Install config (handled by setup.sh)
    a. System preferences
    b. Dotfiles
    c. Application config

7. Re-sync everything else from the Cloud™ (eg. Backblaze)
    a. TODO: make this work

### Seed

The seed is an encrypted package that contains sufficient information to
obtain access to all other authentication credentials. It is small, changes
regularly (but infrequently) and is only physically accessible by the owner.

In practice, this might look something like:

- A *very* memorable passphrase
- 2 flash drives located in physically isolated locations
- Package is a tarball encrypted with SSL
- Contains:
-- Instructions on where to find remaining credentials
-- KeePass file w/ credentials for accessing supplimental credentials
-- Hints to the passphrase in case it has slipped from memory
- Once a quarter, a calendar reminder to practice unlocking seed
- Once a year, a calendar reminder to rotate passphrase


### Installers mirrored at pkgs.distributed.io

- [Butler](http://pkgs.distributed.io/Butler.dmg)
- [ClipMenu](http://pkgs.distributed.io/ClipMenu.dmg)
- [iStats](http://pkgs.distributed.io/iStats.dmg)
- [Alfred](http://pkgs.distributed.io/Alfred.dmg)
- [PathFinder](http://pkgs.distributed.io/PathFinder.dmg)
