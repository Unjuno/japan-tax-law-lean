### CustomsTariffArt15PriorUseException.lean — 独立原文監査（Batch CT-EXC-PRIOR-USE）

- 一次資料（pinned・改変禁止）: `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`
  law_id `143AC0000000054`, revision `143AC0000000054_20260601_508AC0000000005`, 施行日 2026-06-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:15` 第1項第九号の
  逐語「ただし、その入国前にこれらの者が既に使用したもの（船舶及び航空機については、その入国前一年以上これらの者が使用したもの）に限る。」を
  取得（raw 内出現回数 = 1）。漢字「一年」を自前で 1 年 = 12 月に変換。
- 照合 / 判定: 実装 `oneYearMonths = 12` と独立仕様 `specOneYear = 1`（年）は
  `months = years * 12` の下で一致（D=PASS）。一般貨物 0 月 → false / 1 月 → true、
  船舶・航空機 11 月 → false / 12 月 → true / 24 月 → true を kernel `decide` で確認。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1 船舶・航空機については入国前一年以上（>=12月）の使用が必要である。
- **T（再現検査）**: T1 pinned `Article:15` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {1} を受容；
  T4 Lean の全 examples が kernel-decided。
- **D（合否）**: D1 PASS（一年 = 12月 の対応）／D2 PASS（一般 2 点・船舶 3 点、矛盾 0）。
- **C（対立解釈）**: C1 「一年以上」を「一年を超える」と読む解釈は 12 月境界を変えるため採用しない。
- **U（不確かさ）**: U1 免除の本則・「これらの者」・他の号・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
