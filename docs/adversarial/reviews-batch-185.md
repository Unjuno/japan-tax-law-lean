# Adversarial review — batch 185

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for SignedAdjustmentAmount.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### SignedAdjustmentAmount.lean — 震災復興特別交付税額 第五条（符号付き調整額の算定）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: law id 507M60000008043, revision 507M60000008043_20250425_000000000000000
  (省令 / MinisterialOrdinance: 地方団体に対して交付すべき令和七年度分の震災復興特別交付税の額の算定方法、決定時期及び決定額並びに交付時期及び交付額等の特例に関する省令)
- Source: data/raw/507M60000008043_20250425_000000000000000.law.json
- SHA-256: 02d256b8f5b48afc01a886eebb88ed78eec7d84d4726a543088115ba8f32f60e (SHA-256 照合 OK)
- Article Num: 5 (第五条). Scoped Article 5 に needle 1 箇所一致を照合（法全文にも一致）。
- Needle verbatim in scoped Article 5:
  「令和八年三月において、令和七年度三月震災復興特別交付税額は、前条の規定によって算定した額から第一号の額を減額した後の額に第二号の額を加算した額（同号の額が負数となるときは、当該負数となる額に相当する額を減額した額）から第三号の額を減額した額とする。」
- Statutory literals 7 / 8 / 3 (spec_literals = {7, 8, 3}): 七（令和七年度）, 八（令和八年）, 三（三月 / 第三号）
  — all verbatim in the needle; source_literals_verified({7,8,3}, scoped) True,
  parse_statutory_rate is None (no 百分の rate in this clause).
- Model: targetYear=8 / targetMonth=3 (算定時点), baseYear=7 (対象年度);
  grantAmount base item1 item2 item3 = (base:Int) - item1 + item2 - item3 (signed Int, 円).
- 第二号の額が負数の場合: 「当該負数となる額に相当する額を減額」は当該絶対値を減額することと同値。
  item2 : Int をそのまま加算するのは item2 < 0 のとき -|item2| を加えることであり、条項と一致。
  結果は符号付き Int であり、負の調整額をゼロに切り捨てない（BY-DESIGN / CONFIRMED）。
- 境界カテゴリ (>=3): zero (0), small_input (3,5,7,8 ほか), saturation (0),
  threshold_below (6 = 7-1, 2 = 3-1), threshold_at (7, 8, 3), threshold_above (4 = 3+1)
  — いずれも kernel-decided examples として記録。
- 独立仕様: specYear / specMonth / specBaseYear / specCompute は実装 identifier を使わず再定義。
  bridges agreeYear / agreeMonth / agreeBaseYear / agreeCompute は純粋 `unfold ... ; rfl` のみで、
  各 unfold リストは展開時点のゴールに実在する定数だけを列挙（追加公理なし）。
- 非介入: 前条の規定による base の算定、第一号・第二号・第三号の定義、他条・他項は NOT MODELLED。
- 判定 (H/T/D/C/U): H（符号付き四段階調整額の算定という明示的 norm）, T（7/8/3、bytes pinned by SHA-256）,
  D（rfl / by decide のみ、負の item2 も by decide で検証）, C（needle verbatim、≥3 境界カテゴリ、spec 独立性確認）,
  U（前条の算定・各号の定義・他条は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
