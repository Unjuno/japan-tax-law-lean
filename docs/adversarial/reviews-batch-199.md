# Adversarial review — batch 199

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for SpecialIncomeTaxCreditCap25.lean and its independent Spec/Tests
modules. Reproducible from committed bytes. NOT a human legal review; no
reviewer or approval field is recorded here.

### SpecialIncomeTaxCreditCap25.lean — 租税特別措置法 第四十一条の十八 第二項

BY-DESIGN / 照合 (kernel/CI attestation と evidence ledger 接続は後続)。

- 一次資料: 租税特別措置法 (law id 332AC0000000026), revision
  332AC0000000026_20261101_507AC0000000013, enforced 2026-11-01.
- Source: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
- SHA-256: e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee
  (matched against INVENTORY raw_snapshot.source_sha256).
- 独立再抽出: walked `law_full_text` to Article `Num=41_18`, then
  `Paragraph#2 / ParagraphSentence / Sentence#2`; scoped article 2403 chars.
  Needle
  「当該控除する金額が、当該個人のその年分の所得税の額の百分の二十五に相当する金額を超えるときは」
  occurs exactly once in that scoped article; negative control on `41_18_2`
  gives zero. The pinned source_path and queue unit
  NORM|93070e2906c9df8b4d204aaa6d6539a2e60e2843d8d930ca16be14deaba3d888
  are recorded in both the model header and the transcription pin.
- Statutory rate: 「百分の二十五」 = 25/100 = 1/4
  (`parse_statutory_rate` returns Fraction(1,4)); 二十五/百 found verbatim in
  the scoped clause. `clause_correspondence({25,100}, …) → True`.
- 端数処理: the parenthetical attaches ONLY to 当該百分の二十五に相当する金額:
  百円未満の端数切り捨て. The implementation floors that cap to 100 yen;
  it does NOT floor the credit itself and introduces no half-up/nearest rule.
  `cap_never_exceeds_raw` and `floor_remainder_lt_hundred` are proved by omega.
- 上限: 「超えるときは」 is strict; `allowedCredit = min credit cap`, with
  kernel-proved below-cap identity and over-cap saturation.
- 検証例: zero, small inputs, inputs adjacent to literals 25/100, 100-yen
  floor around 400/401/799/800, strict cap at 100/101, impl/spec agreement.
  These are finite smoke checks; the universal statements are the impl theorems.
- 独立仕様: specNumerator/specDenominator/specFloorUnit/specCap/specAllowed
  are defined without implementation identifiers; agree* are separate bridges.
- 判定 (H/T/D/C/U): H（控除額は所得税額の25%相当額を上限とし、百円未満切捨て）,
  T（25, 100, 二十五, 百, bytes pinned by SHA-256）, D（rfl / decide / omega のみ）,
  C（needle scoped 一意、率 1/4、端数条項の帰属確認、spec 独立性）,
  U（控除額の算定（1項）、税額、該当性、3項繰越、他の条・法令は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
