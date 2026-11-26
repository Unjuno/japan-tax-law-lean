# Adversarial review — batch 269

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold normative units from the pinned 地方税法 snapshot. No human
legal approval is recorded here; every unit remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item where applicable), never accepted as a
number found merely somewhere in the whole text. The queue records were filtered
with one mmap pass over `build/task_queue.json`: law id in
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

### LocalTax774DirectorTermWithin3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百七十四条 (Num 774), paragraph 1 (本則, `MainProvision[8]`),
  `ParagraphSentence/Sentence#1`.
- Normative unit `NORM|54ffe3da6c646aeab65f80b4de6357617c748c2815840ad48200b2f412500b3e` (kind EFFECT).
- Needle 「役員の任期は、三年以内において定款で定める期間とする。」;
  三 = 3 years, 「以内」 is INCLUSIVE (`≤`), so 3 years is inside the term window
  and 4 years is outside. The needle is unique in this pinned snapshot (one
  article occurrence, one string hit), so the 第七百七十四条(1) anchor is unambiguous.
  The 第七百六十八条 委員の任期 unit modelled in batch 267 is a different article
  and is not re-modelled here.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `2 = true` (below),
  `3 = true` (limit, inclusive), `4 = false` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 distinct categories).
- Independent spec states the ceiling as `years ≤ 3` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第七百七十四条(1)の役員の任期は三年以内において定款で定める期間とするという効果）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（定款で定める期間の決定・第七百六十八条の委員任期条項・他条項は非介入）,
  U（人間の法的レビューなし、定款の規定内容・他条項は未判定）。

### LocalTax15ThreeWheelsOrMoreEnvironmentLevy.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 附則第十五条 (Num 15), paragraph 1 (`LawBody[898]/SupplProvision/SupplProvision[15]`),
  `ParagraphSentence/Sentence#1`.
- Normative unit `NORM|c5c0f2e55d3881a2c321f662cbdf3bdd5cd31739cf3bc87467299df86af5c5cc` (kind CONDITION).
- Needle 「新法の規定中軽自動車税の環境性能割に関する部分は、施行日以後に取得された三輪以上の軽自動車に対して課すべき軽自動車税の環境性能割について適用し、施行日前に取得された三輪以上の軽自動車に対して課する軽自動車税の環境性能割については、なお従前の例による。」;
  三 = 3 wheels, 「以上」 is INCLUSIVE (`≤`), so a three-wheel vehicle qualifies
  and two wheels does not. The same sentence also occurs (with an extra prefix)
  in 附則第十七条; this unit is anchored to the 附則第十五条(1) location named by
  the source path, not to that parallel occurrence. Because `find_article_text`
  sees main provisions only, the transcription check uses the file locator and
  the numbered article/paragraph pin from the source path.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `2 = false` (below),
  `3 = true` (limit, inclusive), `4 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 distinct categories).
- Independent spec states the floor as `3 ≤ wheels` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（附則第十五条(1)の施行日以後に取得された三輪以上の軽自動車への環境性能割適用という条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（施行日前の取得に対する従前の例・附則第十七条の並行箇所・環境性能割の税率計算・他条項は非介入）,
  U（人間の法的レビューなし、車両区分の認定・他条項は未判定）。

### LocalTax20_9_3UnavoidableReasonWithin2Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十条の九の三 (Num 20_9_3), paragraph 2, item 3 (本則, `MainProvision[0]`),
  `ItemSentence/Sentence#1`.
- Normative unit `NORM|75034509ba5d2231b887bb3c9b813cba6e2ade8221a8a42cb8d76f3a5d3a6ed5` (kind DELEGATION).
- Needle 「その他当該地方税の法定納期限後に生じた前二号に類する政令で定めるやむを得ない理由があるとき。　当該理由が生じた日の翌日から起算して二月以内」;
  二 = 2 months, 「以内」 is INCLUSIVE (`≤`), so 2 months is inside the window
  and 3 months is outside. The needle is unique in this pinned snapshot (one
  article occurrence, one string hit). The 第二号 parallel clause modelled in
  batch 267 is a different item and is not re-modelled here.
- Boundaries: `inScopeBool 0 = true`, `1 = true` (below),
  `2 = true` (limit, inclusive), `3 = false` (above) —
  `zero`, `threshold_below`, `threshold_at`, `threshold_above`
  (4 distinct categories).
- Independent spec states the ceiling as `months ≤ 2` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第二十条の九の三(2)第三号の政令で定めるやむを得ない理由が生じた日から二月以内という委任）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第一号・第二号の理由・政令で定める理由の認定・第二号の並行条項・他号他条項は非介入）,
  U（人間の法的レビューなし、やむを得ない理由の該当性・他号は未判定）。

### LocalTax73_27_4DeferralWithin2Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の二十七の四 (Num 73_27_4), paragraph 2 (本則, `MainProvision[1]`),
  `ParagraphSentence/Sentence#1`.
- Normative unit `NORM|c02a507f8ab5cdf636c40c43bb7672cbf336b5dd346bc969f362dc48aa4339cd` (kind CONDITION).
- Needle 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から二年以内の期間を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」;
  二 = 2 years, 「以内」 is INCLUSIVE (`≤`), so 2 years is inside the deferral
  period and 3 years is outside. The needle is unique in this pinned snapshot
  (one article occurrence, one string hit), so the 第七十三条の二十七の四(2)
  anchor is unambiguous.
- Boundaries: `inScopeBool 0 = true`, `1 = true` (below),
  `2 = true` (limit, inclusive), `3 = false` (above) —
  `zero`, `threshold_below`, `threshold_at`, `threshold_above`
  (4 distinct categories).
- Independent spec states the ceiling as `years ≤ 2` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第七十三条の二十七の四(2)の取得の日から二年以内の期間を限つて徴収猶予するという条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（申告の真実性認定・市町村の条例で定めるところ・徴収猶予の手続一般・他条項は非介入）,
  U（人間の法的レビューなし、申告の真実性・他条項は未判定）。

### LocalTax702_4UrbanPlanningTaxRateCeiling.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百二条の四 (Num 702_4), paragraph 1 (本則, `MainProvision[3]`),
  `ParagraphSentence/Sentence#1`.
- Normative unit `NORM|bd21112adbd4c11ce1eab7b3047d2190416c6163ac975b12a7bccff529579dfb` (kind CONDITION).
- Needle 「都市計画税の税率は、百分の〇・三を超えることができない。」;
  三 = 3 in 百分の〇・三 = 3 / 1000, and 「を超え」 is STRICT (`>`), so a rate of
  exactly 3 permille is permitted and 4 permille is the first prohibited rate.
  The model expresses the prohibited exceedance; the spec carries the literal 3
  and the statutory 百分 denominator basis (1000) so the rate ratio is exact —
  a single literal 3 with N/100 would NOT match this clause rate. The needle is
  unique in this pinned snapshot (one article occurrence, one string hit), so
  the 第七百二条の四(1) anchor is unambiguous. The 軽油の数量百分の〇・三
  computation in LocalTaxLightOilQuantity is a different article and is not
  re-modelled here.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `2 = false` (below),
  `3 = false` (at, strict), `4 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 distinct categories).
- Independent spec states the exceedance as `Nat.succ 3 ≤ permille` from
  statutory literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（第七百二条の四(1)の都市計画税の税率が百分の〇・三を超えることを禁止する条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（百分の〇・三の税率そのもの・軽油数量への同率適用・税率算定手続・他条項は非介入）,
  U（人間の法的レビューなし、税率の算定・他条項は未判定）。
