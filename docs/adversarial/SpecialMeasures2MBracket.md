### SpecialMeasures2MBracket.lean — 独立原文監査（Batch SM-2M）

- 一次資料（pinned・改変禁止）: `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`
  law_id `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`, 施行日 2026-11-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:70_2_5` の
  逐語「二百万円以下の金額」を取得（raw 内出現回数 = 1）。漢字「二百万」を自前で 2,000,000 に変換。
- 照合 / 判定: 実装 `bracketCap = 2_000_000` と独立仕様 `specCap = 2000000` は再抽出値と
  一致（D=PASS）。境界 1,999,999 → true / 2,000,000 → true / 2,000,001 → false を kernel `decide`
  で確認。桁違い（200,000 / 20,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「二百万」= ¥2,000,000 であり、境界は「以下」（inclusive, ≤）である。
- **T（再現検査）**: T1 pinned `Article:70_2_5` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {2000000} を受容；
  T4 Lean 境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（二百万 = 2,000,000 一致）／D2 PASS（境界 3 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「以下」を「未満」（exclusive）と読む解釈は境界 2,000,000 を変える。
  原文逐語の「以下」を採用した理由を記録。
- **U（不確かさ）**: U1 当該区分の税率・他の区分・基準額の計算・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
