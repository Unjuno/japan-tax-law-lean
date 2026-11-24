### CustomsUnfiledSurcharge3M.lean — 独立原文監査（Batch CUS-3M）

- 一次資料（pinned・改変禁止）: `data/raw/329AC0000000061_20260601_508AC0000000005.law.json`
  law_id `329AC0000000061`, revision `329AC0000000061_20260601_508AC0000000005`, 施行日 2026-06-01。
- 独立再抽出: coordinator の数式・doc-comment を信じず、pinned JSON の `Sentence` ノードを再帰走査し、
  `Article:12_3` 第3項の逐語「加算後累積納付税額 … が三百万円を超えるとき」を取得。
  漢字「三百万」を自前で 3,000,000 に変換。下位_item の「三百万円を超える部分」も確認。
- 照合 / 判定: 実装 `cumulativePaidThreshold = 3_000_000` と独立仕様 `specThreshold = 3000000`
  は再抽出値と一致（D=PASS）。境界 2,999,999 → false / 3,000,000 → false / 3,000,001 → true
  を kernel `decide` で確認。桁違い（300,000 / 30,000,000）は混入していない。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1「三百万」= ¥3,000,000 であり、境界は「超える」（exclusive, >）である。
- **T（再現検査）**: T1 pinned JSON の当該 `Article:12_3` を直接 walk し needle の所在を確認；
  T2 `transcription_audit.py` の pin が scoped で PASS；T3 Lean の境界 examples が全て kernel-decided。
- **D（合否）**: D1 PASS（三百万 = 3,000,000 一致）／D2 PASS（境界 3 点一致、矛盾 0）。
- **C（対立解釈）**: C1 「超える」を「以上」（inclusive）と読む解釈は境界 3,000,000 を変える。
  原文逐語の「超える」を採用した理由を記録。
- **U（不確かさ）**: U1 段階税率・期限後特例申告の5%減額・控除額の政令計算・他項は本規範単位の外で
  NOT MODELLED。人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
