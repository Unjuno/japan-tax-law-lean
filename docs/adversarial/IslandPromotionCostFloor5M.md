### IslandPromotionCostFloor5M.lean — 独立原文監査（Batch ISL-5M）

- 一次資料（pinned・改変禁止）: `data/raw/405M50000008001_20250401_507M60000008028.law.json`
  law_id `405M50000008001`, revision `405M50000008001_20250401_507M60000008028`, 施行日 2025-04-01。
  本法名は「税」を含まないが、不均一課税の関係で発見・取得された関連法源（L0）である。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:2` の
  逐語「五百万円以上のもの」を取得（raw 内出現回数 = 1）。漢字「五百万」を自前で 5,000,000 に変換。
- 照合 / 判定: 実装 `costFloor = 5_000_000` と独立仕様 `specFloor = 5000000` は
  再抽出値と一致（D=PASS）。境界 4,999,999 → false / 5,000,000 → true /
  5,000,001 → true を kernel `decide` で確認。桁違い（500,000 / 50,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「五百万」= ¥5,000,000 であり、境界は「以上」（inclusive, ≥）である。
- **T（再現検査）**: T1 pinned `Article:2` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {5000000} を受容；
  T4 Lean 境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（五百万 = 5,000,000 一致）／D2 PASS（境界 3 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「以上」を「超える」（exclusive）と読む解釈は境界 5,000,000 を変える。
  原文逐語の「以上」を採用した理由を記録。
- **U（不確かさ）**: U1 不均一課税率・区分・計算・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
