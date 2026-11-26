### StampDutyThreshold100k.lean — 独立原文監査（Batch STAMP-100K）

- 一次資料（pinned・改変禁止）: `data/raw/342AC0000000023_20261001_507AC0000000070.law.json`
  law_id `342AC0000000023`, revision `342AC0000000023_20261001_507AC0000000070`, 施行日 2026-10-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:4` の
  逐語「十万円を超える金額」を取得（raw 内出現回数 = 1）。漢字「十万」を自前で 100,000 に変換。
- 照合 / 判定: 実装 `threshold = 100_000` と独立仕様 `specThreshold = 100000` は再抽出値と
  一致（D=PASS）。境界 99,999 → false / 100,000 → false / 100,001 → true を kernel `decide` で確認。
  桁違い（10,000 / 1,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「十万」= ¥100,000 であり、境界は「超える」（exclusive, >）である。
- **T（再現検査）**: T1 pinned `Article:4` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {100000} を受容；
  T4 Lean 境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（十万 = 100,000 一致）／D2 PASS（境界 3 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「超える」を「以上」（inclusive）と読む解釈は境界 100,000 を変える。
  原文逐語の「超える」を採用した理由を記録。
- **U（不確かさ）**: U1 税率・文書区分・計算・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
