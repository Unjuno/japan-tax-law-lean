# UNIT — WidowDependentIncomeCeiling5M（地方税法 art.23 第11号イ(2)・第12号ロ）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law_id: `325AC0000000226`
- revision: `325AC0000000226_20261101_508AC0000000002`
- source: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
- 対象 norm unit（別セルの二箇所）:
  - `NORM|20023274153ede974e448682730839241c024ddddff2cd0a418d2dfa8805f544`
    `.../Article:23/.../Item#11/Subitem1#1/Subitem2#2/.../Sentence#1`
  - `NORM|757833559d3485ee59a2b2ba2fe43572563f6d8754538ea91e57753baa31d5f0`
    `.../Article:23/.../Item#12/Subitem1#2/.../Sentence#1`
- 原文逐語: 「前年の合計所得金額が五百万円以下であること。」
- 独立仕様: `JapanTaxLaw/WidowDependentIncomeCeiling5MSpec.lean`
- 実装: `JapanTaxLaw/WidowDependentIncomeCeiling5M.lean`
- 境界: `JapanTaxLaw/WidowDependentIncomeCeiling5MTests.lean`（4_999_999 / 5_000_000 / 5_000_001）
- 独立レビュー: `docs/adversarial/reviews-cycle114-shares.md`

## 対象範囲（一部の計算可能な規則のみ）

対象は所与の前年合計所得金額に対する「五百万円以下」判定のみ。
寡婦・ひとり親の他の要件、所得金額の算定、税額計算、市町村民税側の条項は **未対応**。
本ユニットは条文全体の形式化を主張しない。

## H/T/D/C/U

- H: 「以下」を「未満」として境界値を除外した可能性。
- T: 原文「以下」を確認し `withinCeiling 5_000_000 = true` をカーネル決定。
- D: BY-DESIGN / CONFIRMED 0（技術的照合のみ）。
- C: 第12号ロはイ(2) を援用するため同一文言が二セルに現れる（別IDで固定）。
- U: 他の要件・算定・税額は未対応。法的レビューは未実施。
