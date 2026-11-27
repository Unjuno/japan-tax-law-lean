

## Second resume attempt (this turn) — same race confirmed

- Candidate branch `candidate/norm-unit-18` commit `ffeed84ee2f88d0415f0182c20f3e70bd563a87e`,
  built off `main` `ebc2a8760`: unit evidence 11 axes, 17/17 invariants locally,
  cross-law 0 failed, all regeneration gates rc=0.
- CI run `45978196835` triggered on that exact commit **before** PR creation:
  both required checks **SUCCESS**.
- PR #955 created from that commit; during the ~25-minute CI window `main`
  advanced again and the PR became `CONFLICTING` (merge ref null). All merge
  retries were rejected with "Pull Request has merge conflicts". PR #952 was
  closed as superseded.
- Conclusion: repeated conflict resolution + strict merge-commit checks cannot
  converge while other agents keep regenerating derived ledgers on `main`.
  No unit-18 status/evidence was written to `main` (`status=None`, evidence
  absent). Resume only when `main` is stable for a full CI window.
