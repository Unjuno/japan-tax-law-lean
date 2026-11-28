### InheritanceTaxArt37ReadingOneYear.lean — 独立原文監査（Batch INH-READ-1Y）

- 一次資料（pinned・改変禁止）: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
  law_id `325AC0000000073`, revision `325AC0000000073_20260401_506AC0000000008`, 施行日 2026-04-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:37` 第6項の
  逐語「この場合において、同項ただし書中「二年」とあるのは、「一年」と読み替えるものとする。」を
  取得（raw 内出現回数 = 1）。漢字「二」「一」を自前で 2 年 / 1 年 = 12 月に変換。
- 照合 / 判定: 実装 `originalYears=2`, `replacementYears=1`, `effectiveMonths=12` と
  独立仕様 `specOriginal=2`, `specReplacement=1`, `specLimit=12` は一致（D=PASS）。
  11 月 → true / 12 月 → true / 13 月 → false / 24 月 → false を kernel `decide` で確認。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1 読み替え後の期間は 1 年（12 月）であり、境界 12 月を含む。
- **T（再現検査）**: T1 pinned `Article:37` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {1,2} と {2} を受容；
  T4 Lean の全 examples が kernel-decided。
- **D（合否）**: D1 PASS（二年/一年/12月 の対応）／D2 PASS（11/12/13/24 月、矛盾 0）。
- **C（対立解釈）**: C1 二年を実効期間とする解釈、または「この場合」外へ読み替えを
  拡張する解釈は原文と矛盾するため採用しない。
- **U（不確かさ）**: U1 ただし書の実質・発動条件・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
