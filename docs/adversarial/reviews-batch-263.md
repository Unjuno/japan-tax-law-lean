# Adversarial review — batch 263

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold normative units from the pinned 地方税法 snapshot. No human
legal approval is recorded here; every unit remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (never accepted as a number found anywhere in
the whole text). The queue records were filtered with one mmap pass over
`build/task_queue.json`: law id in {325AC0000000073, 325AC0000000226}, status
`NOT_STARTED`, no dependencies, short scoped text, one threshold marker
(以上 / 以下 / 超え) and exactly one kanji numeral >= 2 (never 一). Existing
`JapanTaxLaw/*.lean`, the transcription checks and
`data/TRANSCRIPTION_CHECK_REGISTRY.json` were searched first; none of these five
units was previously modelled. 「以上」 and 「以下」/「以内」 are INCLUSIVE;
「を超え」 is STRICT. No statutory literal 1 is used as a threshold value. All
boundary examples are kernel-decided (`by unfold …; decide`), not asserted by
prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax71_16UnpaidOver2M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十一条の十六 (Num 71_16), paragraph 2 (本則), sentence 1.
- Normative unit `NORM|ac7a3ed89541e42133587152b49c0d96ece56d8b428fc091560cdb2c3542c51b`.
- Needle 「前項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」;
  二 = ¥2,000,000, 「を超え」 is STRICT (`>`), so ¥2,000,000 is excluded and
  ¥2,000,001 opens the discretionary rule. The discretionary upper bound
  (「未納税額に相当する額以下」), the underlying offense and the parallel clauses in
  第七十一条の三十七・五十七 and 第三百二十四条 are not modelled.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `1_999_999 = false`
  (below), `2_000_000 = false` (at, strict), `2_000_001 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec rewrites the trigger as `Nat.succ 2_000_000 ≤ unpaid` from
  statutory literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第七十一条の十六(2)の未納税額が二百万円を超える場合という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文は第七十一条の三十七・五十七・第三百二十四条にも現れるが本件は第七十一条の十六(2)に限定、罰金の裁量的上限・罪の成立要件は非介入）,
  U（人間の法的レビューなし、裁量判断・他条項は未判定）。

### LocalTax4MunicipalIncomeOver30M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四条 (Num 4), paragraph 10 (附則, `SupplProvision[8]`), sentence 2.
- Normative unit `NORM|1c7214750d121f7442a8bfbeb97da2332dafa39cf38696835515cd565588dd8d`.
- Needle 「ただし、当該納税義務者の前年の合計所得金額が三千万円を超える年度分の市町村民税の所得割については、この限りでない。」;
  三 = ¥30,000,000, 「を超え」 is STRICT (`>`), so ¥30,000,000 is excluded and
  ¥30,000,001 satisfies the proviso condition. This is the 市町村民税 proviso;
  the exception's legal effect (この限りでない), the 道府県民税 counterpart and
  the parallel 第四条の二 clause are not modelled.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `29_999_999 = false`
  (below), `30_000_000 = false` (at, strict), `30_000_001 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec rewrites the trigger as `Nat.succ 30_000_000 ≤ income` from
  statutory literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第四条(10)附則の市町村民税に係る合計所得金額三千万円超という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文は第四条の二にも現れるが本件は第四条(10)附則に限定、「この限りでない」の効果・道府県民税側は非介入）,
  U（人間の法的レビューなし、例外の適用効果・他条項は未判定）。

### LocalTax144_33FineCeiling7M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百四十四条の三十三 (Num 144_33), paragraph 2 (本則), sentence 1.
- Normative unit `NORM|48959028bb9de1c9c17fd4332379c0417d316df9696589f1c981a23cf9253b2d`.
- Needle 「情を知つて、前項の罪に当たる行為に要する資金、土地、建物、艦船、車両、設備、機械、器具、原材料又は薬品を提供し、又は運搬したときは、その違反行為をした者は、七年以下の拘禁刑若しくは七百万円以下の罰金に処し、又はこれを併科する。」;
  七 = ¥7,000,000, 「以下」 is INCLUSIVE (`≤`), so ¥7,000,000 is inside the
  ceiling and ¥7,000,001 is outside. The parallel 七年以下の拘禁刑 ceiling, the
  enumerated articles, the offense elements and the concurrent-sentence option
  are not modelled.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `6_999_999 = true`
  (below), `7_000_000 = true` (ceiling, inclusive), `7_000_001 = false`
  (above) — `zero`, `small_input`, `below_ceiling`, `ceiling_at`,
  `above_ceiling` (5 categories).
- Independent spec states the ceiling as `fine ≤ 7_000_000` from statutory
  literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第百四十四条の三十三(2)の罰金七百万円以下という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（七年以下の拘禁刑上限・供与物件の列挙・罪の成立要件・併科の選択は非介入）,
  U（人間の法的レビューなし、量刑判断・他条項は未判定）。

### LocalTax13LightOilOver30k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第十三条 (Num 13), paragraph 5 (附則, `SupplProvision[13]`), sentence 1.
- Normative unit `NORM|4e51e0d6668782583c66ee66593a6b848cc53501bea65b66e65aa1a81146634a`.
- Needle 「道府県知事は、前項の規定により申告納付すべき軽油引取税の額が三万円を超える場合には、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」;
  三 = ¥30,000, 「を超え」 is STRICT (`>`), so ¥30,000 is excluded and
  ¥30,001 opens the deferral rule. The three-month deferral-period ceiling
  (三月以内), the application requirement, the deferral's legal effect and the
  parallel 第十五条 clause are not modelled.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `29_999 = false` (below),
  `30_000 = false` (at, strict), `30_001 = true` (above) — `zero`,
  `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec rewrites the trigger as `Nat.succ 30_000 ≤ tax` from
  statutory literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第十三条(5)附則の軽油引取税額が三万円を超える場合という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文は第十五条にも現れるが本件は第十三条(5)に限定、三月以内の期間・申請要件・猶予効果は非介入）,
  U（人間の法的レビューなし、猶予の適用判断・他条項は未判定）。

### LocalTax62EvadedOver5M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第六十二条 (Num 62), paragraph 4 (本則), sentence 1.
- Normative unit `NORM|16b527dd4211b210e351650a3c39cb0830052394e247e9d20cead79e4666ab8d`.
- Needle 「前項の免れた税額が五百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、五百万円を超える額でその免れた税額に相当する額以下の額とすることができる。」;
  五 = ¥5,000,000, 「を超え」 is STRICT (`>`), so ¥5,000,000 is excluded and
  ¥5,000,001 opens the discretionary rule. The discretionary upper bound
  (「免れた税額に相当する額以下」), the underlying offense, the parallel clauses in
  第七十二条の四十九の三・六十・九十五条 and 第百四十四条の四十一条, and the
  相続税法 第六十八条(4) counterpart are not modelled.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `4_999_999 = false`
  (below), `5_000_000 = false` (at, strict), `5_000_001 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec rewrites the trigger as `Nat.succ 5_000_000 ≤ evaded` from
  statutory literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第六十二条(4)の免れた税額が五百万円を超える場合という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文は他条項・相続税法第六十八条(4)にも現れるが本件は第六十二条(4)に限定、罰金の裁量的上限・罪の成立要件は非介入）,
  U（人間の法的レビューなし、裁量判断・他条項は未判定）。

All five checks above are mechanical re-extractions and structural/kernel
checks only. None of them constitutes a human legal review or approval;
`LEGAL_REVIEW_PENDING` remains recorded for every unit.
