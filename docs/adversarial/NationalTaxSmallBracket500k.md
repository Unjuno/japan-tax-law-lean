### NationalTaxSmallBracket500k.lean — 独立原文監査（Batch NAT-500K）

- 一次資料（pinned・改変禁止）: `data/raw/337AC0000000066_20261101_507AC0000000013.law.json`
  law_id `337AC0000000066`, revision `337AC0000000066_20261101_507AC0000000013`, 施行日 2026-11-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:66` 第3項第一号の
  逐語「五十万円以下の部分に相当する税額」を取得（raw 内出現回数 = 1）。
  漢字「五十万」を自前で 500,000 に変換。
- 照合 / 判定: 実装 `bracketCap = 500_000` と独立仕様 `specCap = 500000` は
  再抽出値と一致（D=PASS）。境界 499,999 → true / 500,000 → true /
  500,001 → false を kernel `decide` で確認。
- 後続監査: 同条の別号に「百分の五」があるが本号 clause には無く、
  `clause_correspondence` は {500000} を受容し {5,100,500000} を拒否。
  条項スコープが正しく機能していることを確認（過剰クレジットなし）。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「五十万」= ¥500,000 であり、境界は「以下」（inclusive, ≤）である。
- **T（再現検査）**: T1 pinned `Article:66` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {500000} のみを受容；
  T4 Lean 境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（五十万 = 500,000 一致）／D2 PASS（境界 3 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「以下」を「未満」（exclusive）と読む解釈は境界 500,000 を変える。
  原文逐語の「以下」を採用した理由を記録。
- **U（不確かさ）**: U1 当該区分の税率・他の号・合計・政令計算は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
