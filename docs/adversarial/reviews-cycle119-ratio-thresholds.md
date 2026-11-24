# Adversarial review — cycle-119 独立再抽出（技術的検証のみ）

- 日付: 2026-11-25
- 位置づけ: 技術的な原文照合・仕様対応のレビュー。**人間の法律的レビューではない。**
  法的レビューは `LEGAL_REVIEW_PENDING` のまま。架空の承認記録は作成しない。
- 手法: doc-comment の法令ID・版から pinned raw JSON を読み、原文ツリーを直接走査して
  該当条文を独立に再抽出し、Spec の定数・境界例と照合した。
- H/T/D/C/U: H=反証可能な仮説, T=検証手続, D=判定, C=競合する読み, U=未解決の不確実性。

### SpecialMeasuresDistributionRatio90.lean — 租税特別措置法 art.68の3の3（>90%）

- pin: law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013` /
  Article Num=`68_3_3`。
- 独立再抽出: 「…割合として政令で定める割合が百分の九十を超えていること。」
- 照合: 原文「九十」「百分」「超えている」を `90 < ratePerHundred` に対応。
  `agreeSpecialMeasuresDistributionRatio90` が 8 点で実装と独立仕様の一致をカーネル決定する。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「『超える』を『以上』として境界値 90 を含めた」可能性。
  T（検証）: 原文「超えている」を確認し `exceeds90 90 = false` をカーネル決定。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: 政令で定める割合の算定は原文上別途委任されており、本モデルは入力を caller-established とする。
  U（不確実性）: 分配可能収益額・政令の算定・適用効果は未対応。法的レビューは未実施。

### SpecialMeasuresRealEstateRatio75.lean — 租税特別措置法 art.83の2の2（≥75%）

- pin: law `332AC0000000026` / rev 同上 / Article Num=`83_2_2`。
- 独立再抽出: 「特定不動産の割合が百分の七十五以上であること。」
- 照合: 原文「七十五」「百分」「以上」を `75 <= ratePerHundred` に対応。
  `agreeSpecialMeasuresRealEstateRatio75` が 8 点で一致をカーネル決定する。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「『以上』を『超える』として境界値 75 を除外した」可能性。
  T（検証）: 原文「以上」を確認し `atLeast75 75 = true` をカーネル決定。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: 90% 超の規定と境界包含関係が異なるが、原文の文言で区別した。
  U（不確実性）: 特定不動産の定義・割合算定・適用効果は未対応。法的レビューは未実施。

## 結論

二モジュールはいずれも **fidelity-only** の技術的照合に留まる。
「技術的検証済み / 形式化未完了 / 法的レビュー未完了」は分離したままである。
