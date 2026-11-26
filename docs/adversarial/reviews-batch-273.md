# Adversarial review — batch 273

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 相続税法 / 地方税法 snapshots.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

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
importing `scripts/ci/generate_verification_evidence.py` (module import only,
main NOT run), using `checks_by_module()` and `tq.build_tasks` for the law, and
confirming verifiable kind, empty `unhandled_conditions`,
`clause_correspondence` True with basis `spec numerals / rate ratio in clause`,
unit text inside `scoped_article_text(law, article, needles)`, coverage exact +
unique ids, and a source path. 「以上」/「以下」/「以内」 are INCLUSIVE;
「をこえる/を超え」 is STRICT. No statutory literal 1 is used as a threshold
value. The single-literal `百分のN` ceiling is used only where N/100 is exactly
the clause rate. All boundary examples are kernel-decided (`by unfold …;
decide`, plus `inScopeBool N = bool := by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax39CorrectionWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第三十九条 (Num 39), paragraph 12 (本則, `MainProvision[5]`),
  `LawBody[3]/MainProvision/MainProvision[5]/Article:39/Article#39/Paragraph#12/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|b9bdb97609b2cd079263a67e16cf8c6ef9ff1996f73885dde279cc7a208fe9fb` (kind REFERENCE).
- Needle 「第十項の規定により申請書の訂正又は担保提供関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該担保提供関係書類の訂正若しくは提出をしなければならない。」;
  二十 = 20 days, 「以内」 is INCLUSIVE (`≤`), so 20 days is inside and 21 days is outside.
  The needle is unique in the pinned snapshot (one scoped article hit), so the 第三十九条(12) anchor is unambiguous. Scope verification was scoped to the article + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `19 = true`, `20 = true` (limit, inclusive),
  `21 = false` — `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories, all kernel-decided).
- Independent spec states the ceiling as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第三十九条(12)の通知を受けた日の翌日から二十日以内に申請書等の訂正又は提出をしなければならないという参照上の期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2163 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第十項の訂正要求自体・前項の通知自体・担保提供関係書類の範囲・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax453FalseReportFine300k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四百五十三条 (Num 453), paragraph 1 (本則, `MainProvision[2]`),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:453/Article#453/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|8311a201119c59741799c239199a5642445159b19be078bdf7d711ea69d3ec64` (kind REFERENCE).
- Needle 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、三十万円以下の罰金に処する。」;
  三十万 = 300,000 yen, 「以下」 is INCLUSIVE (`≤`), so 300,000 yen is inside and 300,001 yen is outside.
  The same sentence also occurs in 第七百条の五十七; this unit is pinned to the 第四百五十三条(1) instance named by source_path, not to that parallel occurrence. Scope verification was scoped to the article + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `299999 = true`, `300000 = true` (limit, inclusive),
  `300001 = false` — `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories, all kernel-decided).
- Independent spec states the ceiling as `yen ≤ 300000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第四百五十三条(1)の虚偽の申告又は報告をした者を三十万円以下の罰金に処するという参照上の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2163 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前条の申告義務自体・違反行為の認定・第七百条の五十七の並行箇所・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax144_35LightOilReportWithin30Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百四十四条の三十五 (Num 144_35), paragraph 2 (本則, `MainProvision[1]`),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:144_35/Article#144_35/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|68f012fc552eb8c27456bcd4e8a1308a808cdfcc26e8d96b1ccc5084c3db665c` (kind DELEGATION).
- Needle 「前項に規定する者以外の者は、軽油の製造をした場合には、当該製造をした日から三十日以内に軽油の製造に関する事実及びその数量その他の総務省令で定める事項を、総務省令で定める道府県知事に報告しなければならない。」;
  三十 = 30 days, 「以内」 is INCLUSIVE (`≤`), so 30 days is inside and 31 days is outside.
  The needle is unique in the pinned snapshot (one scoped article hit), so the 第百四十四条の三十五(2) anchor is unambiguous. Scope verification was scoped to the article + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `29 = true`, `30 = true` (limit, inclusive),
  `31 = false` — `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories, all kernel-decided).
- Independent spec states the ceiling as `days ≤ 30` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第百四十四条の三十五(2)の軽油の製造をした日から三十日以内に製造の事実及び数量等を報告しなければならないという委任的期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2163 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前項の製造者自体・総務省令で定める事項・報告先の道府県知事・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax21LightOilTaxOver30000.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 附則第十七条 (Num 21), paragraph 2 (附則, `SupplProvision[17]`),
  `LawBody[194]/SupplProvision/SupplProvision[17]/Article:21/Article#21/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|2ff2e096d5946f481973daedfde6604605d9dd19488fa70102523bcd1199b925` (kind CONDITION).
- Needle 「道府県知事は、前項の場合における軽油引取税額が三万円をこえるときは、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」;
  三万 = 30,000 yen, 「をこえる」 is STRICT (`<`, threshold excluded), so 30,001 yen is inside and 30,000 yen itself is outside.
  The same sentence also occurs in 附則第四十九条; this unit is pinned to the 附則第十七条(2) instance named by source_path, not to that parallel occurrence. The separate 「三月以内」 deferral-period threshold in the same sentence is NOT modelled by this unit. Scope verification was scoped to the article + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `29999 = false`, `30000 = false` (limit, STRICT-excluded),
  `30001 = true` — `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories, all kernel-decided).
- Independent spec states the strict lower bound as `30000 < yen` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（附則第十七条(2)の軽油引取税額が三万円をこえる場合に徴収の猶予をすることができるという条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2163 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（三万円以下の金額・三月以内の猶予期間自体・特約業者/元売業者/小売業者の範囲・附則第四十九条の並行箇所・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax63CovidRevenueCeiling70Percent.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 附則第201条 第六十三条 (Num 63), paragraph 1, item 2 (附則, `SupplProvision[201]`),
  `LawBody[3]/SupplProvision/SupplProvision[201]/Article:63/Article#63/Paragraph#1/Item#2/ItemSentence/Column#1/Sentence#1`.
- Normative unit `NORM|c35ee98744ccc80bb3d6b925eebf58da4cc987cb655bfc560ec17b229ffdd042` (kind EXCEPTION).
- Needle 「新型コロナウイルス感染症及びそのまん延防止のための措置の影響により当該中小事業者等の事業収入割合が百分の七十以下となる場合（前号に掲げる場合を除く。）」;
  百分の七十 = 70/100 = 0.7, 「以下」 is INCLUSIVE (`≤`), so 70 (per hundred) is inside and 71 is outside.
  The single-literal `百分のN` ceiling is used only because N/100 = 70/100 is exactly the clause rate. The needle is unique in the pinned snapshot (one scoped article hit), so the 附則第201条 第六十三条(1)2 anchor is unambiguous. Scope verification was scoped to the article + paragraph + item of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `69 = true`, `70 = true` (limit, inclusive),
  `71 = false` — `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories, all kernel-decided).
- Independent spec states the rate ceiling as `percent ≤ 70` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（附則第201条(1)2の新型コロナウイルス感染症の影響による中小事業者等の事業収入割合が百分の七十以下となる場合という例外条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2163 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前号に掲げる場合・感染症の定義・中小事業者等の範囲・他の号の税率表・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。
