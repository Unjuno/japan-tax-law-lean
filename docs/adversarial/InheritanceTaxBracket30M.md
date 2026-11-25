### InheritanceTaxBracket30M.lean — 独立原文監査（Batch INH-30M）

- 一次資料（pinned・改変禁止）: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
  law_id `325AC0000000073`, revision `325AC0000000073_20260401_506AC0000000008`, 施行日 2026-04-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:21_7` の
  逐語「三千万円を超える金額」を取得（raw 内出現回数 = 1）。漢字「三千万」を
  自前で 30,000,000 に変換。
- 照合 / 判定: 実装 `bracketThreshold = 30_000_000` と独立仕様 `specThreshold = 30000000`
  は再抽出値と一致（D=PASS）。境界 29,999,999 → false / 30,000,000 → false /
  30,000,001 → true を kernel `decide` で確認。桁違い（3,000,000 / 300,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「三千万」= ¥30,000,000 であり、境界は「超える」（exclusive, >）である。
- **T（再現検査）**: T1 pinned `Article:21_7` を直接 walk し needle の所在・一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {30000000} を受容；
  T4 Lean 境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（三千万 = 30,000,000 一致）／D2 PASS（境界 3 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「超える」を「以上」（inclusive）と読む解釈は境界 30,000,000 を変える。
  原文逐語の「超える」を採用した理由を記録。
- **U（不確かさ）**: U1 当該区分の税率・他の区分・控除・他条項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
