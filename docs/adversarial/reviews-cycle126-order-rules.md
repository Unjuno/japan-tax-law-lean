# Adversarial review — cycle-126 独立再抽出（技術的検証のみ）

- 日付: 2026-11-26
- 位置づけ: 技術的な原文照合・仕様対応のレビュー。**人間の法律的レビューではない。**
  法的レビューは `LEGAL_REVIEW_PENDING` のまま。架空の承認記録は作成しない。
- 手法: doc-comment の法令ID・版から pinned raw JSON を読み、原文ツリーを直接走査して
  該当条文を独立に再抽出し、Spec の定数・境界例と照合した。
- H/T/D/C/U: H=反証可能な仮説, T=検証手続, D=判定, C=競合する読み, U=未解決の不確実性。

### InheritanceTaxOrderOwnership50Threshold.lean — 相続税法施行令 art.31（50%超）

- pin: law `325CO0000000071` / rev `325CO0000000071_20260401_506CO0000000143` /
  Article Num=`31`。
- 独立再抽出: 「…発行済株式等の百分の五十を超える株式等が同項の個人等により所有されている場合」
- 照合: 原文「五十」「百分」「超える」を `50 < percent` に対応。
  `agreeInheritanceTaxOrderOwnership50Threshold` が 8 点で一致をカーネル決定する。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「『超える』を『以上』として境界値 50 を含めた」可能性。
  T（検証）: `exceeds50 50 = false`, `51 = true` をカーネル決定。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: 租税特別措置法施行令 art.19の3 と同一文言だが、条・法令IDで識別。
  U（不確実性）: 株主法人・個人等の定義・所有割合算定は未対応。法的レビューは未実施。

### LocalBusinessTaxOrderRate77PerMilleC.lean — 地方税法施行令 art.35の4の5（7.7%）

- pin: law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083` /
  Article Num=`35_4_5`。
- 独立再抽出: 「法第七十二条の七十六の政令で定める率は、百分の七・七とする。」
- 照合: 原文「七・七」を `77 / 1000` の正確な有理数に対応。
  `agreeLocalBusinessTaxOrderRate77PerMilleC` が 11 点（76/77/78, 999/1000/1001）で一致をカーネル決定。
- 判定: **BY-DESIGN / CONFIRMED 0**。
- H（仮説）: 「7.7% を 77% と誤読した」可能性。
  T（検証）: 原文「七・七」を独立再抽出し、分子 77 分母 1000 を照合。
  D（判定）: BY-DESIGN / CONFIRMED 0。
  C（競合）: art.35の4の7 と同率だが、別の表セルとして `source_path` で固定。
  U（不確実性）: 法第72条の76の要件・金額算定・端数は未対応。法的レビューは未実施。

## 結論

二モジュールはいずれも **fidelity-only** の技術的照合に留まる。
「技術的検証済み / 形式化未完了 / 法的レビュー未完了」は分離したままである。
