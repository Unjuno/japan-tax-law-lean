# Adversarial review — batch 265

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold normative units from the pinned 地方税法 / 相続税法 snapshots.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item/subitem where applicable), never
accepted as a number found merely somewhere in the whole text. The queue records
were filtered with one mmap pass over `build/task_queue.json`: law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies, short
scoped text, a threshold marker (以上 / 以下 / 超え / 以内) and exactly one kanji
numeral >= 2 (never 一). Existing `JapanTaxLaw/*.lean`, the transcription checks
and `data/TRANSCRIPTION_CHECK_REGISTRY.json` were searched first; none of these
five units was previously modelled. 「以上」/「以下」/「以内」 are INCLUSIVE;
「を超え」 is STRICT. No statutory literal 1 is used as a threshold value. All
boundary examples are kernel-decided (`by unfold …; decide`), not asserted by
prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax9_2IncomeOver4M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第九条の二 (Num 9_2), paragraph 1 (附則, `SupplProvision[40]`),
  table-cell sentence (`.../QuoteStruct/TableStruct/Table/TableRow/TableColumn/Sentence#1`).
- Normative unit `NORM|759e48c5272d4e80fb1eef6e3ab2e1e8be0f33f1bc07441bce274ec56d3899e5`.
- Needle 「各事業年度の所得のうち年四百万円を超える金額」;
  四 = ¥4,000,000, 「を超え」 is STRICT (`>`), so ¥4,000,000 is excluded and
  ¥4,000,001 opens the 附則 table cell's excess-amount category. The same string
  also appears in 第七十二条の二十四の七 (本則); this unit is anchored to the
  第九条の二(1) 附則 occurrence named by the source path, not to that parallel one.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `3_999_999 = false`
  (below), `4_000_000 = false` (at, strict), `4_000_001 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec rewrites the trigger as `Nat.succ 4_000_000 ≤ income` from
  statutory literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第九条の二(1)附則の表の各事業年度の所得のうち年四百万円を超える金額という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文は第七十二条の二十四の七にも現れるが本件は附則 第九条の二(1) の表に限定、一億円の上限帯・他セル・他条項は非介入）,
  U（人間の法的レビューなし、表の他帯域・他条項は未判定）。

### LocalTax314_2DisasterExpenseCeiling50k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百十四条の二 (Num 314_2), paragraph 1, item 1, subitem 1 (本則,
  `MainProvision[2]`), `Column#1/Sentence#1`.
- Normative unit `NORM|d8d7b0c15d19914c08c6a785dbc3f29d7ccddc822b57d955b319f2593243cc7c`.
- Needle 「損失の金額に含まれる災害関連支出の金額（損失の金額のうち災害に直接関連して支出をした金額として政令で定める金額をいう。以下この号において同じ。）が五万円以下である場合（災害関連支出の金額がない場合を含む。）」;
  五 = ¥50,000, 「以下」 is INCLUSIVE (`≤`), so ¥50,000 is inside the ceiling
  and ¥50,001 is outside. The same amount string also appears in 第三十四条;
  this unit is scoped to 第三百十四条の二(1) 第一号 イ(1) named by the source path.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `49_999 = true`
  (below), `50_000 = true` (ceiling, inclusive), `50_001 = false` (above) —
  `zero`, `small_input`, `below_ceiling`, `ceiling_at`, `above_ceiling`
  (5 categories).
- Independent spec states the ceiling as `expense ≤ 50_000` from statutory
  literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第三百十四条の二(1)第一号の災害関連支出の金額が五万円以下である場合という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文は第三十四条にも現れるが本件は第三百十四条の二(1)に限定、五万円を超える部分の控除・金額がない場合の取扱い・他号は非介入）,
  U（人間の法的レビューなし、災害関連支出の認定・他号は未判定）。

### InheritanceTax3RetirementAllowanceWithin3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`, raw snapshot
  `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第三条 (Num 3), paragraph 1, item 2 (本則, `MainProvision[0]`),
  `ItemSentence/Sentence#1`.
- Normative unit `NORM|339e1c6391e8d960650f591239c4d75846c44428c868cb7af1346b14d910fd41`.
- Needle 「被相続人の死亡により相続人その他の者が当該被相続人に支給されるべきであつた退職手当金、功労金その他これらに準ずる給与（政令で定める給付を含む。）で被相続人の死亡後三年以内に支給が確定したものの支給を受けた場合においては、当該給与の支給を受けた者について、当該給与」;
  三 = 3 years, 「以内」 is INCLUSIVE (`≤`), so 3 years is inside the window
  and 4 years is outside. The decomposition classifies this clause as
  DELEGATION (政令で定める給付) with no unhandled conditions; the needle is
  unique in this pinned snapshot (one article occurrence, one string hit), so
  the 第三条(1) 第二号 anchor is unambiguous.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `2 = true` (below),
  `3 = true` (limit, inclusive), `4 = false` (above) —
  `zero`, `small_input`, `below_limit`, `limit_at`, `above_limit`
  (5 categories).
- Independent spec states the ceiling as `years ≤ 3` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第三条(1)第二号の被相続人の死亡後三年以内に支給が確定した退職手当金等という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（政令で定める給付の委任・支給を受けた者・第三条の他号・他条項は非介入）,
  U（人間の法的レビューなし、給付の該当性・他号は未判定）。

### LocalTax144_9OpinionWithin2Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百四十四条の九 (Num 144_9), paragraph 5, sentence 2 (本則,
  `MainProvision[1]`), `ParagraphSentence/Sentence#2`.
- Normative unit `NORM|c90ef816ff3c43e4ff6d397e8c1e9d833c132ad2ae0e639c47c9932e427b0aaf`.
- Needle 「ただし、関係道府県知事と意見を異にする場合においては、当該書類を受け取つた日から二月以内に、自己の意見を付して、当該書類を総務大臣に送付するとともに、その指示を求めなければならない。」;
  二 = 2 months, 「以内」 is INCLUSIVE (`≤`), so 2 months is inside the
  deadline and 3 months is outside. The needle is unique in this pinned
  snapshot (one article occurrence, one string hit).
- Boundaries: `inScopeBool 0 = true`, `1 = true` (below),
  `2 = true` (limit, inclusive), `3 = false` (above) —
  `zero`, `small_input`, `limit_at`, `above_limit` (4 categories).
- Independent spec states the ceiling as `months ≤ 2` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第百四十四条の九(5)の書類受領日から二月以内の意見付送付という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（関係道府県知事と意見を異にする場合・指示を求める効果・他項は非介入）,
  U（人間の法的レビューなし、意見の内容・指示の適用は未判定）。

### LocalTax72_24_5TwoPrefectures.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の二十四の五 (Num 72_24_5), paragraph 3, sentence 1 (本則,
  `MainProvision[1]`), `ParagraphSentence/Sentence#1`.
- Normative unit `NORM|6e670927c16fc5079d514ad476d019dda5156c1ca70b0fe0fef1919e37171284`.
- Needle 「前項の場合においては、その区分計算の方法について、事務所又は事業所所在地の道府県知事（二以上の道府県において事務所又は事業所を設けて事業を行う法人にあつては、主たる事務所又は事業所所在地の道府県知事）の承認を受けなければならない。」;
  二 = 2 prefectures, 「以上」 is INCLUSIVE (`≥`), so 2 prefectures qualifies
  and 1 does not. The needle is unique in this pinned snapshot (one article
  occurrence, one string hit).
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below),
  `2 = true` (threshold, inclusive), `3 = true` (above) —
  `zero`, `below_threshold`, `threshold_at`, `threshold_above`
  (4 categories).
- Independent spec states the lower bound as `2 ≤ prefectures` from statutory
  literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第七十二条の二十四の五(3)の二以上の道府県に事務所等を設ける法人という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（区分計算の方法・主たる事務所所在地知事への読み替え・承認要件・他項は非介入）,
  U（人間の法的レビューなし、承認の判断・他項は未判定）。

All five checks above are mechanical re-extractions and structural/kernel
checks only. None of them constitutes a human legal review or approval;
`LEGAL_REVIEW_PENDING` remains recorded for every unit.
