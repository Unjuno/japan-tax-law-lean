# Adversarial review — cycle-127 独立再抽出（技術的検証のみ）

- 日付: 2026-11-26
- 位置づけ: 技術的な原文照合・仕様対応のレビュー。**人間の法律的レビューではない。**
  法的レビューは `LEGAL_REVIEW_PENDING` のまま。架空の承認記録は作成しない。
- 手法: doc-comment の法令ID・版から pinned raw JSON を読み、原文ツリーを直接走査して
  該当条文を独立に再抽出し、Spec の定数・境界例と照合した。
- H/T/D/C/U: H=反証可能な仮説, T=検証手続, D=判定, C=競合する読み, U=未解決の不確実性。

### InheritanceTaxEvasionFineCap10M.lean — 相続税法 art.68（1000万円）

- pin: law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008` /
  Article Num=`68`。
- 独立再抽出: 「…十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」
- 照合: 原文「千万円」「以下」を `fine <= 10000000` に対応。
  `agreeInheritanceTaxEvasionFineCap10M` が 6 点で一致をカーネル決定する。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「1000万ではなく 100万 と誤読した」可能性。
  T（検証）: 原文「千万円」を独立再抽出し、Spec 定数 10000000 と照合。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: 併科や拘禁刑は原文上別の効果であり、本モデルは金額上限のみ。
  U（不確実性）: 不正行為の認定・科刑手続は未対応。法的レビューは未実施。

### LocalTaxDeferralSmallAmountException1MB.lean — 地方税法 art.72の39の2（100万円）

- pin: law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002` /
  Article Num=`72_39_2`。
- 独立再抽出: 「ただし、その猶予に係る税額が百万円以下である場合、…」
- 照合: 原文「百万円」「以下」を `tax <= 1000000` に対応。
  `agreeLocalTaxDeferralSmallAmountException1MB` が 6 点で一致をカーネル決定する。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「art.55の2 の証跡を本条に流用した」可能性。
  T（検証）: 両条の `source_path` と法令IDを別々に確認。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: 同趣旨の規定が複数の条に存在するため、条番号でセルを固定した。
  U（不確実性）: 期間・担保・手続は未対応。法的レビューは未実施。

## 結論

二モジュールはいずれも **fidelity-only** の技術的照合に留まる。
「技術的検証済み / 形式化未完了 / 法的レビュー未完了」は分離したままである。
