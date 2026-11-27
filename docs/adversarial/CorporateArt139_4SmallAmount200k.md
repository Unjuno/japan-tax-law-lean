### CorporateArt139_4SmallAmount200k.lean — 独立原文監査（Batch CORP-200K）

- 一次資料（pinned・改変禁止）: `data/raw/340CO0000000097_20261001_507CO0000000121.law.json`
  law_id `340CO0000000097`, revision `340CO0000000097_20261001_507CO0000000121`, 施行日 2026-10-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:139_4` 第2項第三号の
  逐語「二十万円未満である場合」を取得（raw 内出現回数 = 1）。漢字「二十万」を自前で 200,000 に変換。
- 照合 / 判定: 実装 `amountCap = 200_000` と独立仕様 `specCap = 200000` は再抽出値と
  一致（D=PASS）。境界 199,999 → true / 200,000 → false / 200,001 → false を
  kernel `decide` で確認。桁違い（20,000 / 2,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「二十万」= ¥200,000 であり、境界は「未満」（exclusive, <）である。
- **T（再現検査）**: T1 pinned `Article:139_4` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {200000} を受容；
  T4 Lean 境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（二十万 = 200,000 一致）／D2 PASS（境界 3 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「未満」を「以下」（inclusive）と読む解釈は境界 200,000 を変える。
  原文逐語の「未満」を採用した理由を記録。
- **U（不確かさ）**: U1 税額計算・他の号・区分・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
