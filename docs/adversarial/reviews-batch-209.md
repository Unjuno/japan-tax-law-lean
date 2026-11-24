### DelegatedEnforcement3M.lean — 公布後三月以内の政令施行日（委任＋期間上限）

- 独立再抽出（独立抽出 / 一次資料）: law id 422AC1000000050; revision
  422AC1000000050_20110701_423AC0000000016;
  source data/raw/422AC1000000050_20110701_423AC0000000016.law.json;
  blob 13,204 bytes (CRLF count 0), SHA-256 independently recomputed
  `1b7e343b06e305a7e494f501aac926f9a2153a35ad06fcf8ee0dca7c64da17ab`
  — matches impl pin.
- 照合（Article Num 1, 附則）: needle found verbatim, 一字一句改変なし:
  「この法律は、公布の日から起算して三月を超えない範囲内において政令で定める日から施行する。」
- Statutory literal: 三 → 3 (三月 = within 3 months); transcribed literal set
  {3}; no 百分の rate, parse_statutory_rate = None;
  source_literals_verified({3}, scoped) = True. Bound is INCLUSIVE
  (三月を超えない = n <= 3): 3 true, 4 false.
- 判定: BY-DESIGN / CONFIRMED — TEMPORAL DELEGATION: statutory upper bound on
  a date fixed by cabinet order. The exact delegated date is NOT MODELLED
  (caller-established); only the bound and its Bool membership test are.
  No off-by-one: within_3 true, within_4 false.
- H/T/D/C/U: H（SHA and needle independently re-extracted from raw bytes/JSON）,
  T（Article Num 1, 三 → specWindowMonths = 3, decide(n <= 3) kernel-decided
  at 0/1/2/3/4）,
  D（specWindowMonths / specWithin bodies contain no impl identifiers;
  independent_spec_ok = True）,
  C（agreeWindowMonths and agreeWithin are unfold + rfl bridges only）,
  U（boundary categories from generate_verification_evidence:
  zero 0, small_input 1/2, threshold_below 2, threshold_at 3,
  threshold_above 4 — 5 >= 3; exact delegated date and legal effect
  reserved for human review）.
- 限定: 機械的独立クロスチェックであり人間の法律レビューではない
  (mechanical, not human, review). H/T/D/C/U is a machine-generated audit
  tuple, not a human sign-off; no lake/lean re-run here — only in-tree
  detector computations plus Python-simulated Nat/Bool expectations.
