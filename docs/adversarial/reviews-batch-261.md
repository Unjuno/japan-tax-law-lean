# Adversarial review — batch 261

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold normative units from the pinned 相続税法 / 地方税法 snapshots.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

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
「を超え」 is STRICT. No statutory literal 1 is used as a threshold value.
All boundary examples are kernel-decided (`by unfold …; decide`), not asserted
by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax4PrefecturalIncomeOver30M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四条 (Num 4), paragraph 4 (附則, `SupplProvision[8]`), sentence 2.
- Normative unit `NORM|c2defeb5ea627e9628ce7e8d9c270d6685c7e6c3d735d02f0e3aefd014c8ea9d`.
- Needle 「ただし、当該納税義務者の前年の合計所得金額が三千万円を超える年度分の道府県民税の所得割については、この限りでない。」;
  三 = ¥30,000,000, 「を超え」 is STRICT (`>`), so ¥30,000,000 is excluded and
  ¥30,000,001 satisfies the proviso condition. The exception's legal effect and
  the 市町村民税 counterpart are not modelled.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `29_999_999 = false`
  (below), `30_000_000 = false` (at, strict), `30_000_001 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec rewrites the trigger as `Nat.succ 30_000_000 ≤ income` from
  statutory literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第四条(4)附則の合計所得金額三千万円超という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文が他条にも現れるが本件は第四条(4)に限定、「この限りでない」の効果は非介入）,
  U（人間の法的レビューなし、例外の適用効果・他条項は未判定）。

### LocalTax7NoticeCountOver5.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七条 (Num 7), paragraph 6, item 3 (附則, `SupplProvision[26]`).
- Normative unit `NORM|684887421d790491d80566333d163df1918443214a9cca488c35761f9813f27e`.
- Needle 「当該申告特例対象年に支出した特例控除対象寄附金について、前項の規定により申告特例通知書を送付した都道府県知事等の数が五を超えたとき。」;
  五 = 5 通知先, 「を超え」 is STRICT (`>`), so 5 is excluded and 6 qualifies.
  The donation classification and the notification duty itself are not modelled.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `4 = false` (below),
  `5 = false` (at, strict), `6 = true` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `Nat.succ 5 ≤ count` from statutory
  literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第七条(6)3附則の通知先数が五を超えたときという条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文は第七条(13)にも現れるが本件は(6)3に限定、寄附金の分類は非介入）,
  U（人間の法的レビューなし、通知義務の発生・他号は未判定）。

### LocalTax72_55TwoPrefectureIndividual.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の五十五 (Num 72_55), paragraph 3 (本則), sentence 1.
- Normative unit `NORM|45172d5ee0ea8f0b6dbdd216cc0ca0816616481385413b1dc37a63b7758ccd32`.
- Needle 「二以上の道府県に事務所又は事業所を設けて事業を行う個人」;
  二 = 2, 「以上」 is INCLUSIVE (`≥`), so 1 prefecture is below the floor and
  2 satisfies it. The filing-addressee rule and the 「前二項」 reference are
  not modelled.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `threshold_below`, `threshold_at`,
  `threshold_above` (4 categories).
- Independent spec rewrites the floor as `2 ≤ prefectures` from statutory
  literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第七十二条の五十五(3)の二以上の道府県という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（「前二項」の二は参照番号であり閾値ではない、申告先規則は非介入）,
  U（人間の法的レビューなし、申告先・他項は未判定）。

### InheritanceTaxPenaltyOver5M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`, raw snapshot
  `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第六十八条 (Num 68), paragraph 4 (本則), sentence 1.
- Normative unit `NORM|8689d9ba56a471797ef0a9a690495dcaf7afa565240759409456acef128e0a2f`.
- Needle 「免れた相続税額又は贈与税額が五百万円を超えるときは、情状により、同項の罰金は、五百万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」;
  五 = ¥5,000,000, 「を超え」 is STRICT (`>`), so ¥5,000,000 is excluded and
  ¥5,000,001 opens the discretionary rule. The discretionary upper bound
  (「〜に相当する金額以下」) and the underlying offense are not modelled.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `4_999_999 = false`
  (below), `5_000_000 = false` (at, strict), `5_000_001 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec rewrites the trigger as `Nat.succ 5_000_000 ≤ evaded` from
  statutory literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第六十八条(4)の免れた税額が五百万円を超えるときという条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（罰金の裁量的上限・罪の成立要件は非介入、他条項の同文は対象外）,
  U（人間の法的レビューなし、裁量判断・他条項は未判定）。

### LocalTax321_11_2DeferralWithin3Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百二十一条の十一の二 (Num 321_11_2), paragraph 2, sentence 2 (本則).
- Normative unit `NORM|86ec2cae4443671ee033ef50dbb02e5b0d82beb07eaa304603fd988e7fcdd950`.
- Needle 「その猶予の期間が三月以内である場合」;
  三 = 3 months, 「以内」/「以下」 is INCLUSIVE (`≤`), so 3 months qualifies and
  4 months is outside. The ¥1,000,000 tax ceiling in the same sentence, the
  exception's effect and the parallel clauses in other articles are not
  modelled.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `2 = true` (below),
  `3 = true` (ceiling, inclusive), `4 = false` (above) — `zero`, `small_input`,
  `below_ceiling`, `ceiling_at`, `above_ceiling` (5 categories).
- Independent spec states the ceiling as `months ≤ 3` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by
  `rfl`.
- H/T/D/C/U: H（第三百二十一条の十一の二(2)の猶予期間三月以内という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文は他条にも現れるが本件は当条(2)に限定、百万円上限・例外効果は非介入）,
  U（人間の法的レビューなし、他条の同一文言・適用効果は未判定）。

All five checks above are mechanical re-extractions and structural/kernel
checks only. None of them constitutes a human legal review or approval;
`LEGAL_REVIEW_PENDING` remains recorded for every unit.
