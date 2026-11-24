# Adversarial review — cycle-123 独立再抽出（技術的検証のみ）

- 日付: 2026-11-25
- 位置づけ: 技術的な原文照合・仕様対応のレビュー。**人間の法律的レビューではない。**
  法的レビューは `LEGAL_REVIEW_PENDING` のまま。架空の承認記録は作成しない。
- 手法: doc-comment の法令ID・版から pinned raw JSON を読み、原文ツリーを直接走査して
  該当条文を独立に再抽出し、Spec の定数・境界例と照合した。
- H/T/D/C/U: H=反証可能な仮説, T=検証手続, D=判定, C=競合する読み, U=未解決の不確実性。

### InheritanceTaxLateFilingFineCap500k.lean — 相続税法 art.69（罰金上限50万円）

- pin: law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008` /
  Article Num=`69`。
- 独立再抽出: 「…一年以下の拘禁刑又は五十万円以下の罰金に処する。」
- 照合: 原文「五十万円」「以下」を `fine <= 500000` に対応。
  `agreeInheritanceTaxLateFilingFineCap500k` が 6 点で一致をカーネル決定する。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「『以下』を『未満』として境界値 500000 を除外した」可能性。
  T（検証）: `withinCap 500000 = true` をカーネル決定。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: 拘禁刑や正当な理由の有無は原文上別の要件であり、本モデルは金額のみ。
  U（不確実性）: 构成要件・科刑手続は未対応。法的レビューは未実施。

### LocalTaxDeferralSmallAmountException1M.lean — 地方税法 art.55の2（100万円）

- pin: law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002` /
  Article Num=`55_2`。
- 独立再抽出: 「ただし、その猶予に係る税額が百万円以下である場合、…」
- 照合: 原文「百万円」「以下」を `tax <= 1000000` に対応。
  `agreeLocalTaxDeferralSmallAmountException1M` が 6 点で一致をカーネル決定する。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「100万円を 10万円 と誤読した」可能性。
  T（検証）: 原文「百万円」を独立再抽出し、Spec 定数 1000000 と照合。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: 同じただし書に期間三月以内・担保徴収不能の事情もあるが、本モデルは金額のみ。
  U（不確実性）: 他の例外要件・手続は未対応。法的レビューは未実施。

## 結論

二モジュールはいずれも **fidelity-only** の技術的照合に留まる。
「技術的検証済み / 形式化未完了 / 法的レビュー未完了」は分離したままである。
