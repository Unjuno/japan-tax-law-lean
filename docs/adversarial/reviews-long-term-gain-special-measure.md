# Adversarial review — LongTermGainSpecialMeasure (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Every statement below was
re-derived from the committed pinned bytes by scripts/ci/generate_verification_evidence.py
and by a direct re-extraction of the raw snapshot; it is not a human legal review.

### LongTermGainSpecialMeasure.lean — 地方税法 附則 art. 34の2 §1 長期譲渡所得特例

判定: 照合 (BY-DESIGN / CONFIRMED — no human legal approval is claimed)

- 独立再抽出 (一次資料): law id 325AC0000000226, enforced revision
  325AC0000000226_20261101_508AC0000000002,
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.
  SHA-256 recomputed from the committed file:
  `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Pinned needle re-extracted from the raw JSON (一字一句, U+3000-free):
  「当該課税長期譲渡所得金額から二千万円を控除した金額の百分の二」.
  The needle occurs in the scoped article and the full text. The exact scoped
  continuation is 「（当該納税義務者が指定都市の区域内に住所を有する場合には、
  百分の一）に相当する金額」.
- Statutory rate ratio: 百分の二 = 2/100 = 1/50 (verified by
  `generate_verification_evidence.parse_statutory_rate`, not by a bare digit
  match in an unrelated article). Independent spec carries the ratio as an
  explicit `(numerator, denominator)` pair `(2, 100)` / designated-city `(1, 100)`.
- The ¥20,000,000 threshold is transcribed as 二千万円 in the scoped 原文.
  `baseAfterDeduction` uses saturating Nat subtraction; the statutory 0 floor
  is NOT modelled as a negative amount.
- Boundary categories (kernel-decided): zero (0), saturation (0 on below/at
  threshold), threshold_below (19,999,999), threshold_at (20,000,000),
  threshold_above (20,000,001). These are genuine adjacent-input checks, not
  incidental digits in a large amount.
- Independent spec: `specMeasure` / `specRate` are defined without any
  implementation identifier (`measure`, `baseAfterDeduction`); the agreement
  bridge is a decidable Bool grid only, never claimed as a universal theorem.
- 監査 (H/T/D/C/U): H（課税長期譲渡所得から2000万円控除後の2%、指定都市1%のみを計算する）,
  T（二千万円 / 百分の二 / 百分の一 / SHA-256 fixed / boundary 19,999,999–20,000,001,
  all kernel-decided）, D（rfl / by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped 原文、rate ratio exact、spec independence confirmed）,
  U（優良住宅地等の認定・適用年度・所得割の他の計算・市町村民税側の特例・
  端数処理の詳細は NOT MODELLED / caller-established; 人間による法的レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — a bounded computable slice only.
  The whole article is NOT claimed as verified.

This review is mechanical. It does NOT satisfy the human legal-review axis,
which remains `LEGAL_REVIEW_PENDING`.
