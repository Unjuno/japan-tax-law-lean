# Adversarial review — cycle-159 独立再抽出（技術的検証のみ）

- 日付: 2026-11-27。位置づけ: 技術的な原文照合。**人間の法律的レビューではない。**
  法的レビューは `LEGAL_REVIEW_PENDING`。架空の承認記録は作成しない。
- 手法: 各法令の pinned raw JSON を直接走査し該当条文を独立再抽出。
- H/T/D/C/U: H=反証可能な仮説, T=検証手続, D=判定, C=競合する読み, U=未解決の不確実性。

### FixedAssetTaxBase5Percent.lean — 地方税法施行令 art.15（5%算定）

- 独立再抽出: 「課税標準となるべき価格に、百分の五を乗じて得た額」
- 照合: 切り捨て符合要求 `100*amount <= 5*base < 100*(amount+1)` をカーネル決定。
- H: 端数処理を四捨五入と誤読した可能性。T: `amount 99 = 4`, `100 = 5`。
  D: BY-DESIGN / CONFIRMED 0。U: 価格の算定・適用年限は未対応。

### SpecialRndDeduction20Percent.lean — 租税特別措置法 art.10の2（20%算定）

- 独立再抽出: 「…政令で定める金額以外の金額の百分の二十に相当する金額」
- 照合: `100*amount <= 20*base < 100*(amount+1)` で再記述。
- H: 20% を 10% と誤読した可能性。T: `amount 100 = 20`, `1_000 = 200`。
  D: BY-DESIGN / CONFIRMED 0。C: 政令で定める金額は caller-established。

## 結論

両モジュールは **fidelity-only** の技術的照合に留まる。
「技術的検証済み / 形式化未完了 / 法的レビュー未完了」は分離したままである。
