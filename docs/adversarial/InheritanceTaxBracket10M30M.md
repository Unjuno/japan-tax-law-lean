### InheritanceTaxBracket10M30M.lean — 独立原文監査（Batch INH-10M30M）

- 一次資料（pinned・改変禁止）: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
  law_id `325AC0000000073`, revision `325AC0000000073_20260401_506AC0000000008`, 施行日 2026-04-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:16` の
  逐語「千万円を超え三千万円以下の金額」を取得（raw 内出現回数 = 1）。
  漢字「千万」を 10,000,000、「三千万」を 30,000,000 に自前変換。
- 照合 / 判定: 実装と独立仕様のリテラル（10,000,000 / 30,000,000）は再抽出値と
  一致（D=PASS）。境界 10,000,000 → false / 10,000,001 → true / 30,000,000 → true /
  30,000,001 → false を kernel `decide` で確認。桁違い（1,000,000 / 100,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「千万」「三千万」= ¥10M / ¥30M；H2「超え」strict lower、
  「以下」inclusive upper。
- **T（再現検査）**: T1 pinned `Article:16` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {10M,30M} を受容；
  T4 Lean 境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（リテラル一致）／D2 PASS（両境界 4 点一致、矛盾 0）。
- **C（対立解釈）**: C1 上限を「未満」、下限を「以上」と読む解釈は区間境界を変える。
  原文逐語の「超え」「以下」を採用した理由を記録。
- **U（不確かさ）**: U1 当該区分の税率・他の区分・控除・他条項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
