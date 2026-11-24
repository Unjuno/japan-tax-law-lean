# Adversarial review — batch 198

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for InterestSplitRate5Pct.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes. This is NOT a human
legal review; no reviewer or approval field is recorded here.

### InterestSplitRate5Pct.lean — 地方税法 第七十一条の六 第一款（利子割の税率）

BY-DESIGN / 判定 = 照合 (kernel/CI attestation と evidence ledger への接続は
attestation 後に別途記録する。現時点では「完了」を主張しない)。

- 一次資料: 地方税法 (law id 325AC0000000226), revision
  325AC0000000226_20261101_508AC0000000002, enforced 2026-11-01.
- Source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
- SHA-256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  (raw bytes; matched against INVENTORY raw_snapshot.source_sha256).
- 独立再抽出: walked `law_full_text` to `Article` whose `Num` normalises to
  `71_6`, then selected `Paragraph#1` → `ParagraphSentence` → `Sentence#1`.
  The scoped sentence is exactly 「利子割の税率は、百分の五とする。」.
  The needle occurs in the scoped paragraph-1 sentence, not merely somewhere in
  the whole law. The pinned structural location is recorded explicitly in the
  model header and in data/TRANSCRIPTION_PINS/InterestSplitRate5Pct.json:
  LawBody[2]/MainProvision/MainProvision[1]/Article:71_6/Article#71_6/Paragraph#1/ParagraphSentence/Sentence#1
  and the queue unit NORM|7e5f5d2a586ff79c2ee3e9c86d120d3180ba67a3d00fd8a4dba9ab376ba02b5a.
- 同一文字列の競合: 第二款 also ends with 「利子割の税率は、百分の五とする。」
  for 租税特別措置法 art. 4-2(9)/4-3(10). The model does NOT fold paragraph 2
  into paragraph 1; the pinned coordinates and the queue unit id distinguish
  them. This was checked explicitly (scoped article shows both occurrences).
- Statutory rate: 「百分の五」 = 5/100 = 1/20. `generate_verification_evidence
  .parse_statutory_rate` returns `Fraction(1, 20)`; `kanji_variants(5)` = {五},
  found verbatim in the scoped clause; 百 is the denominator marker 百分.
- 端数処理: the clause prescribes NO rounding. The implementation stores the
  exact hundred-fold numerator `base * 5` and the denominator 100 separately;
  it does not call `TaxRate.applyFloor`/`applyCeil`. Any yen rounding under
  other provisions is out of scope and recorded as such, not silently imported.
- 検証例 (kernel-decided): zero (0), small_input (1,2,3), and inputs adjacent
  to the spec numerals 5 and 100 (4/5/6, 99/100/101). The evidence generator
  labels these mechanically as threshold_* / saturation categories; this flat
  proportional rule has NO statutory step or saturation boundary, so those
  labels are mechanical coverage categories, not a legal claim about a boundary.
  The examples still distinguish a wrong multiplier or denominator.
  impl/spec agreement is bridged by `unfold`/`rw`/`rfl`.
- 独立仕様: specRateNumerator / specRateDenominator / specHundredFold are
  defined without implementation identifiers; agree* are separate bridges.
- 判定 (H/T/D/C/U): H（第一款の利子割の税率＝百分の五）, T（5, 100, 五, 百,
  bytes pinned by SHA-256）, D（`rfl` / `by decide` のみ）, C（needle は
  scoped paragraph 1、率 1/20 一致、境界カテゴリ充実、spec 独立性確認）,
  U（課税標準の定義、第二款の租税特別措置法参照、第三款の政令委任、
  端数処理・徴収手続は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / 照合済み。CI attestation と evidence ledger
  への接続が完了するまでは FINAL とは書かない。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない
  (mechanical, not human; legal review remains LEGAL_REVIEW_PENDING)。
