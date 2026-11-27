### GeneralTaxActArt66Excess3M.lean — 独立原文監査（Batch GTA-EXCESS-3M）

- 一次資料（pinned・改変禁止）: `data/raw/337AC0000000066_20261101_507AC0000000013.law.json`
  law_id `337AC0000000066`, revision `337AC0000000066_20261101_507AC0000000013`, 施行日 2026-11-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:66` 第3項第三号の
  逐語「三百万円を超える部分に相当する税額」を取得（raw 内出現回数 = 1）。
  漢字「三百万」を自前で 3,000,000 に変換。
- 照合 / 判定: 実装 `threshold = 3_000_000` と独立仕様 `specThreshold = 3000000` は
  再抽出値と一致（D=PASS）。境界 2,999,999 → 0 / 3,000,000 → 0 / 3,000,001 → 1 /
  5,000,000 → 2,000,000 を kernel `decide` で確認。桁違い（300,000 / 30,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「三百万を超える部分」は strict excess であり、境界 3,000,000 では 0 である。
- **T（再現検査）**: T1 pinned `Article:66` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {3000000} を受容し
  {2000000,5000000} を拒否；T4 Lean 境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（三百万 = 3,000,000 一致）／D2 PASS（境界 4 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「超える」を「以上」（inclusive）と読む解釈は境界 3,000,000 を変える。
  原文逐語の「超える」を採用した理由を記録。
- **U（不確かさ）**: U1 超過部分から最終税額への換算（税率）・他の号・上限・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
