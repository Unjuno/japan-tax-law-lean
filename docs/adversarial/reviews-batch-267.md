# Adversarial review — batch 267

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold normative units from the pinned 地方税法 snapshot. No human
legal approval is recorded here; every unit remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item/subitem where applicable), never
accepted as a number found merely somewhere in the whole text. The queue records
were filtered with one mmap pass over `build/task_queue.json`: law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies, short
scoped text, a threshold marker (以上 / 以下 / 超え / 以内) and exactly one kanji
numeral >= 2 (never 一). Existing `JapanTaxLaw/*.lean`, the transcription checks
and `data/TRANSCRIPTION_CHECK_REGISTRY.json` were searched first; none of these
five units was previously modelled. Each candidate was then pre-validated by
importing `scripts/ci/generate_verification_evidence.py` (without running main),
using `checks_by_module()`, building tasks for the law, and confirming verifiable
kind, empty `unhandled_conditions`, `clause_correspondence` True with basis
`spec numerals / rate ratio in clause`, unit text inside `scoped_article_text`,
coverage exact + unique ids, and a source path. 「以上」/「以下」/「以内」 are
INCLUSIVE; 「を超え」 is STRICT. No statutory literal 1 is used as a threshold
value. All boundary examples are kernel-decided (`by unfold …; decide`), not
asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax768CommitteeTermWithin3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百六十八条 (Num 768), paragraph 4 (本則, `MainProvision[8]`),
  `ParagraphSentence/Sentence#1`.
- Normative unit `NORM|e1559bdd4ddc4d9df46494c2f23d924ad0bce2407bd86b187f84e870b5ce5fd1` (kind EFFECT).
- Needle 「委員の任期は、三年以内において定款で定める期間とする。」;
  三 = 3 years, 「以内」 is INCLUSIVE (`≤`), so 3 years is inside the term window
  and 4 years is outside. The needle is unique in this pinned snapshot (one
  article occurrence, one string hit), so the 第七百六十八条(4) anchor is unambiguous.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `2 = true` (below),
  `3 = true` (limit, inclusive), `4 = false` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec states the ceiling as `years ≤ 3` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第七百六十八条(4)の委員の任期は三年以内において定款で定める期間とするという効果）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（定款で定める期間の決定・第七百七十四条の役員任期条項・他条項は非介入）,
  U（人間の法的レビューなし、定款の規定内容・他条項は未判定）。

### LocalTax314_2DisasterExpenseOver50kDeduction.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百十四条の二 (Num 314_2), paragraph 1, item 1, subitem 1(2) (本則,
  `MainProvision[2]`), `Subitem1Sentence/Column#2/Sentence#1`.
- Normative unit `NORM|39ec66d9d2a2e700826a152219efffd237ed7e17d302f5947936e9b9d6d12e95` (kind CONDITION).
- Needle 「損失の金額の合計額から災害関連支出の金額のうち五万円を超える部分の金額を控除した金額とイに定める金額とのいずれか低い金額」;
  五 = ¥50,000, 「を超え」 is STRICT (`>`), so ¥50,000 is excluded and
  ¥50,001 opens the 控除 portion. The same amount string also appears in
  第三十四条; this unit is anchored to the 第三百十四条の二(1) 第一号 ロ(2)
  location named by the source path, not to that parallel occurrence, and the
  五万円以下 ceiling unit modelled in batch 265 is a different clause.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `49_999 = false`
  (below), `50_000 = false` (at, strict), `50_001 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec rewrites the trigger as `Nat.succ 50000 ≤ excess` from
  statutory literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第三百十四条の二(1)第一号の災害関連支出の金額のうち五万円を超える部分を控除するという条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同文は第三十四条にも現れるが本件は第三百十四条の二(1)に限定、損失の金額の合計額・イに定める金額との比較・五万円以下 ceiling・他号は非介入）,
  U（人間の法的レビューなし、災害関連支出の認定・他号は未判定）。

### LocalTax20_9_3CorrectionWithin2Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十条の九の三 (Num 20_9_3), paragraph 2, item 2 (本則, `MainProvision[0]`),
  `ItemSentence/Sentence#1`.
- Normative unit `NORM|c1671aa77270fba7d496c43306f648c02b94b91a89400cdf4c4e8b82477646fc` (kind CONDITION).
- Needle 「その申告、更正又は決定に係る課税標準等又は税額等の計算に当たつてその申告をし、又は決定を受けた者に帰属するものとされていた所得その他課税物件が他の者に帰属するものとする当該他の者に係る地方税の更正、決定又は賦課決定があつたとき。　当該更正、決定又は賦課決定があつた日の翌日から起算して二月以内」;
  二 = 2 months, 「以内」 is INCLUSIVE (`≤`), so 2 months is inside the window
  and 3 months is outside. The single kanji numeral in this needle is 二 (in
  二月以内). The needle is unique in this pinned snapshot (one article occurrence,
  one string hit), so the 第二十条の九の三(2) 第二号 anchor is unambiguous.
- Boundaries: `inScopeBool 0 = true`, `1 = true` (below),
  `2 = true` (limit, inclusive), `3 = false` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec states the ceiling as `months ≤ 2` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第二十条の九の三(2)第二号の更正、決定又は賦課決定があつた日の翌日から起算して二月以内という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（課税標準等又は税額等の計算への帰属・第三号の並行条項・更正決定の認定・他号他条項は非介入）,
  U（人間の法的レビューなし、更正決定の該当性・他号は未判定）。

### LocalTax72_50CorrectionRequestWithin3Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の五十 (Num 72_50), paragraph 3 (本則, `MainProvision[1]`),
  `ParagraphSentence/Sentence#2`.
- Normative unit `NORM|f7f5441b875fc544978242a7175d314dcb4d13b367dd62f30e9bbba111474948` (kind CONDITION).
- Needle 「この場合において、正当な事由がなくて当該税務官署が当該更正の請求を受けた日から三月以内に更正をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正をすべき旨を請求することができる。」;
  三 = 3 months, 「以内」 is INCLUSIVE (`≤`), so 3 months is inside the period
  and 4 months is outside. The needle is unique in this pinned snapshot (one
  article occurrence, one string hit); the 第七十二条の四十 parallel clause uses
  the word 更正又は決定 and is a different unit, not this one.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `2 = true` (below),
  `3 = true` (limit, inclusive), `4 = false` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec states the ceiling as `months ≤ 3` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第七十二条の五十(3)の更正の請求を受けた日から三月以内に更正をしないという条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（正当な事由の有無・道府県知事の監督税務官署への請求・第七十二条の四十の並行条項・他条項は非介入）,
  U（人間の法的レビューなし、正当な事由の該当性・他条項は未判定）。

### LocalTax63TwoPrefecturesNotification.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第六十三条 (Num 63), paragraph 2 (本則, `MainProvision[1]`),
  `ParagraphSentence/Sentence#1`.
- Normative unit `NORM|f29661b98943a9d9ab14d83cebe1757e28b3f65543276704cd3bd8611c780beb` (kind CONDITION).
- Needle 「政府は、法人税に係る更正又は決定の通知をした場合には、遅滞なく、当該更正又は決定に係る所得の金額及び法人税額を当該更正又は決定に係る法人税額の課税標準の算定期間の末日における当該法人の事務所又は事業所（二以上の道府県において事務所又は事業所を有する法人にあつては、その主たる事務所又は事業所）所在地の道府県知事に通知しなければならない。」;
  二 = 2 prefectures, 「以上」 is INCLUSIVE (`≥`), so 2 prefectures qualifies
  and 1 does not. The needle is unique in this pinned snapshot (one article
  occurrence, one string hit). 「二以上の道府県」 also occurs in
  第七十二条の二十四の五; that parallel clause is a different unit and is
  not modelled here.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below),
  `2 = true` (threshold, inclusive), `3 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 categories).
- Independent spec states the floor as `2 ≤ prefectures` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第六十三条(2)の二以上の道府県において事務所又は事業所を有する法人の主たる事務所所在地への通知という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（遅滞なく通知する義務・課税標準の算定期間の末日・第七十二条の二十四の五の並行箇所・他条項は非介入）,
  U（人間の法的レビューなし、法人の事務所該当性・他条項は未判定）。
