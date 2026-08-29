# PolyLinux Lab 2: Text Manipulation and Search

This repository preserves the Robber exercise payload recovered from the live
PolyLinux Lab 2 initrd on 2026-08-29. It contains the installer, eleven Robber
level generators, required word data, cleanup/navigation helpers, login profile,
and the published participant instructions.

The source is intentionally preserved as deployed. It is a legacy baseline and
should be tested and documented before modernization.

See `PROVENANCE.md` for the recovery boundary and source hash.

## Repository contents

- `installrobber.sh` installs the recovered lab in a compatible PolyLinux guest.
- `robber1.sh` through `robber11.sh` generate the learner levels.
- `codedwords.txt` and `wordswithhashes.txt` provide required data.
- `participant-guide.md` preserves the public instructions.
- `provenance/RECOVERY-MANIFEST.json` records the recovered `/root` inventory.

Lab-specific VM images are intentionally excluded and deployed separately.

## License

Licensed under the GNU General Public License v3.0. See `LICENSE`.
