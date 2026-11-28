### LocalTaxArt20_2DeemedDelivery7Days.lean — 独立原文監査（Batch LTA-DEEM-7D）

- 一次資料（pinned・改変禁止）: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
  law_id `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`, 施行日 2026-11-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:20の2` 第3項の
  逐語「前項の場合において、同項の規定による措置を開始した日から起算して七日を経過したときは、書類の送達があつたものとみなす。」を
  取得（raw 内出現回数 = 1）。漢字「七」を自前で 7 日に変換。
- 照合 / 判定: 実装 `deemedDays = 7` と独立仕様 `specDays = 7` は一致（D=PASS）。
  0 日 → false / 6 日 → false / 7 日 → true / 8 日 → true / 14 日 → true を kernel `decide` で確認。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1 措置開始日から 7 日経過で送達とみなす（境界 7 日を含む）。
- **T（再現検査）**: T1 pinned `Article:20の2` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {7} を受容し {6},{8} を拒否；
  T4 Lean の全 examples が kernel-decided。
- **D（合否）**: D1 PASS（七 = 7 一致）／D2 PASS（0/6/7/8/14 日、矛盾 0）。
- **C（対立解釈）**: C1 「七日を経過したとき」を「七日を超えたとき」と読む解釈は
  境界を 8 日に変えるため採用しない。
- **U（不確かさ）**: U1 措置の実質・前項の条件・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
