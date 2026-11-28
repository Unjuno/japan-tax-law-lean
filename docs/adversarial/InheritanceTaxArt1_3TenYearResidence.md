### InheritanceTaxArt1_3TenYearResidence.lean — 独立原文監査（Batch INH-REF-10Y）

- 一次資料（pinned・改変禁止）: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
  law_id `325AC0000000073`, revision `325AC0000000073_20260401_506AC0000000008`, 施行日 2026-04-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:1の3` 第1項第二号イの
  逐語「当該相続又は遺贈に係る相続の開始前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもの」を
  取得（raw 内出現回数 = 1）。漢字「十」を自前で 10 年に変換。
- 照合 / 判定: 実装 `windowYears = 10` と独立仕様 `specWindow = 10` は一致（D=PASS）。
  0 年 → true / 9 年 → true / 10 年 → true / 11 年 → false / 20 年 → false を kernel `decide` で確認。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1  residence 期間は相続開始前 10 年以内であり、境界 10 年を含む。
- **T（再現検査）**: T1 pinned `Article:1の3` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {10} を受容；
  T4 Lean の全 examples が kernel-decided。
- **D（合否）**: D1 PASS（十 = 10 一致）／D2 PASS（0/9/10/11/20 年、矛盾 0）。
- **C（対立解釈）**: C1 「十年以内」を「十年未满」と読む解釈は境界を 11 年に変えるため採用しない。
- **U（不確かさ）**: U1 対象者の同定・他の号・税額計算・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
