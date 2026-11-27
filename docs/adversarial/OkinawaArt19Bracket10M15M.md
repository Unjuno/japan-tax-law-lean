### OkinawaArt19Bracket10M15M.lean — 独立原文監査（Batch OKI-10M-15M）

- 一次資料（pinned・改変禁止）: `data/raw/347CO0000000151_20251231_507CO0000000426.law.json`
  law_id `347CO0000000151`, revision `347CO0000000151_20251231_507CO0000000426`, 施行日 2025-12-31。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:19` の
  逐語「千万円以上千五百万円未満の金額」を取得（raw 内出現回数 = 1）。
  漢字「千万」を 10,000,000、「千五百万」を 15,000,000 に自前変換。
- 照合 / 判定: 実装と独立仕様の下限・上限は再抽出値と一致（D=PASS）。境界
  9,999,999 → false / 10,000,000 → true / 14,999,999 → true / 15,000,000 → false
  を kernel `decide` で確認。桁違い（1,000,000 / 150,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1 区間は `10,000,000 ≤ amount < 15,000,000`（下限 inclusive・上限 exclusive）。
- **T（再現検査）**: T1 pinned `Article:19` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {10000000,15000000} を受容；
  T4 Lean 境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（下限・上限一致）／D2 PASS（両境界 4 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「以上」を「超える」、あるいは「未満」を「以下」と読む解釈は
  区間境界を変える。原文逐語の「以上」「未満」を採用した理由を記録。
- **U（不確かさ）**: U1 当該区分の税率・他の区分・基準額の計算・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
