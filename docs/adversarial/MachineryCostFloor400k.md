### MachineryCostFloor400k.lean — 独立原文監査（Batch MCH-400K）

- 一次資料（pinned・改変禁止）: `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`
  law_id `332CO0000000043`, revision `332CO0000000043_20261101_507CO0000000127`, 施行日 2026-11-01。
- 独立再抽出:  coordinator の数式・doc-comment を信じず、pinned JSON の `Article` のうち canonical number `27_12_4` を再帰走査し、
  逐語「一台又は一基の取得価額が四十万円以上のもの」を取得。漢字「四十万」を自前で 400,000 に変換。
- 照合 / 判定: 実装 `acquisitionCostFloor = 400_000` と独立仕様 `specFloor = 400000` は再抽出値と一致（D=PASS）。
  境界 399,999 → false / 400,000 → true / 400,001 → true を kernel `decide` で確認。桁違い（40,000 / 4,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「四十万円」= ¥400,000 であり、境界は「以上」（inclusive）である。
- **T（再現検査）**: T1 pinned JSON の当該 Article を直接 walk し needle の所在を確認；T2 `transcription_audit.py` の pin が scoped で PASS；T3 Lean の境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（1,000×400 = 400,000 一致）／D2 PASS（境界 3 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「以上」を「超える」（exclusive）と読む解釈は境界 400,000 を変える。原文逐語の「以上」を採用した理由を記録。
- **U（不確かさ）**: U1 周辺の区分定義・特例計算は本規範単位の外で NOT MODELLED。人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
