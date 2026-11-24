### DelegatedEnforcement6M.lean — 公布後六月以内の政令施行日（委任＋期間上限）

- 独立再抽出（独立抽出 / 一次資料）: law id 410AC0000000025; revision
  410AC0000000025_20250401_507AC0000000013;
  source data/raw/410AC0000000025_20250401_507AC0000000013.law.json;
  blob 78,549 bytes (CRLF count 0), SHA-256 independently recomputed
  `81885682cdf2beae20a92d0c6f97674f0c9017909346f41127f574a99ada4ba1`
  — matches impl pin.
- 照合（Article Num 1, 附則）: needle found verbatim, 一字一句改変なし:
  「この法律は、公布の日から起算して六月を超えない範囲内において政令で定める日（以下「施行日」という。）から施行する。」
- Statutory literal: 六 → 6 (六月 = within 6 months); transcribed literal set
  {6}; no 百分の rate, parse_statutory_rate = None;
  source_literals_verified({6}, scoped) = True. Bound is INCLUSIVE
  (六月を超えない = n <= 6): 6 true, 7 false.
- 判定: BY-DESIGN / CONFIRMED — TEMPORAL DELEGATION: statutory upper bound on
  a date fixed by cabinet order and named 施行日. The exact delegated date is
  NOT MODELLED (caller-established); only the bound and its Bool membership
  test are. No off-by-one: within_6 true, within_7 false.
- H/T/D/C/U: H（SHA and needle independently re-extracted from raw bytes/JSON）,
  T（Article Num 1, 六 → specWindowMonths = 6, decide(n <= 6) kernel-decided
  at 0/1/5/6/7）,
  D（specWindowMonths / specWithin bodies contain no impl identifiers;
  independent_spec_ok = True）,
  C（agreeWindowMonths and agreeWithin are unfold + rfl bridges only）,
  U（boundary categories from generate_verification_evidence:
  zero 0, small_input 1/5, threshold_below 5, threshold_at 6,
  threshold_above 7 — 5 >= 3; exact delegated date and legal effect
  reserved for human review）.
- 限定: 機械的独立クロスチェックであり人間の法律レビューではない
  (mechanical, not human, review). H/T/D/C/U is a machine-generated audit
  tuple, not a human sign-off; no lake/lean re-run here — only in-tree
  detector computations plus Python-simulated Nat/Bool expectations.
