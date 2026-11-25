# Adversarial review — cycle-124 独立再抽出（技術的検証のみ）

- 日付: 2026-11-25
- 位置づけ: 技術的な原文照合・仕様対応のレビュー。**人間の法律的レビューではない。**
  法的レビューは `LEGAL_REVIEW_PENDING` のまま。架空の承認記録は作成しない。
- 手法: doc-comment の法令ID・版から pinned raw JSON を読み、原文ツリーを直接走査して
  該当条文を独立に再抽出し、Spec の定数・境界例と照合した。
- H/T/D/C/U: H=反証可能な仮説, T=検証手続, D=判定, C=競合する読み, U=未解決の不確実性。

### LocalTaxFalseFilingFineCap500k.lean — 地方税法 art.22の2（50万円）

- pin: law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002` /
  Article Num=`22_2`。
- 独立再抽出: 「…一年以下の拘禁刑又は五十万円以下の罰金に処する。」
- 照合: 原文「五十万円」「以下」を `fine <= 500000` に対応。
  `agreeLocalTaxFalseFilingFineCap500k` が 6 点で一致をカーネル決定する。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「罰金上限を税額と誤読した」可能性。
  T（検証）: 原文が「罰金」であることを確認し、金額判定のみをモデル化。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: 同じ文言が他条にもあるが、条・原文セルで識別した。
  U（不確実性）: 虚偽記載の認定・拘禁刑・手続は未対応。法的レビューは未実施。

### InheritanceTaxFalseReportFineCap500k.lean — 相続税法 art.70（50万円）

- pin: law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008` /
  Article Num=`70`。
- 独立再抽出: 「…一年以下の拘禁刑又は五十万円以下の罰金に処する。」
- 照合: 原文「五十万円」「以下」を `fine <= 500000` に対応。
  `agreeInheritanceTaxFalseReportFineCap500k` が 6 点で一致をカーネル決定する。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「art.69 の証跡を本条に流用した」可能性。
  T（検証）: 両条の `source_path` と法令IDを別々に確認。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: art.69 と同一文言のため金額のみでは識別不可（条・セルで識別）。
  U（不確実性）: 調書提出義務・虚偽記載の認定は未対応。法的レビューは未実施。

## 結論

二モジュールはいずれも **fidelity-only** の技術的照合に留まる。
「技術的検証済み / 形式化未完了 / 法的レビュー未完了」は分離したままである。
