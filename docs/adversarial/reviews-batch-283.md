# Adversarial review — batch 283

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 相続税法 / 地方税法 snapshots.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item / column where applicable) of the named
`source_path` — never accepted as a number found merely somewhere in the whole
law text. The queue records were filtered with ONE mmap pass over
`build/task_queue.json` (candidates cached under gitignored
`build/batch283_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path, short
scoped text, a threshold marker (以上 / 以下 / 超え / 以内) and exactly one
kanji numeral >= 2 (never statutory literal 1). Existing `JapanTaxLaw/*.lean`,
the transcription checks, `data/TRANSCRIPTION_CHECK_REGISTRY.json` and the
durable transcription pins were searched first; none of these five units was
previously modelled. Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` and `tq.build_tasks` for each law, and
confirming verifiable kind, empty `unhandled_conditions`, no UNRESOLVED unit,
`clause_correspondence` True with basis `spec numerals / rate ratio in clause`,
unit text inside `scoped_article_text(law, article, needles)`, coverage exact +
unique ids, a source path, and verbatim law/revision/needle presence in the
SHA-256-pinned article + paragraph of the raw JSON. No numeral-only match or
UNRESOLVED unit was accepted. 「以上」/「以下」/「以内」 are INCLUSIVE;
「を超え」 is STRICT. No statutory literal 1 is used as a threshold value. The
single-literal `百分のN` ceiling/floor is used only where N/100 is exactly the
clause rate (none of these five units uses one). All boundary examples are
kernel-decided (`by unfold …; decide`, plus `inScopeBool N = bool := by decide`),
not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax1_4TenYearLookbackReference.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第一条の四 (Num 1_4), paragraph 3, item 3, column 2 (本則),
  `LawBody[3]/MainProvision/MainProvision[0]/Article:1_4/Article#1_4/Paragraph#3/Item#3/ItemSentence/Column#2/Sentence#1`.
- Normative unit `NORM|7bed072a3a4e0ce2394ed7c8fb38ee66e7ddc85cb55d45d356db8f5d1207ffc4` (kind REFERENCE).
- Needle 「贈与の時においてこの法律の施行地に住所を有していなかつた当該贈与をした者であつて、当該贈与前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもののうちそのいずれの時においても日本国籍を有していなかつたもの又は当該贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがないものをいう。」;
  贈与前十年以内 is INCLUSIVE (`≤`), so 10 is inside and 11 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph + item, column 2 of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 9 = true`, `inScopeBool 10 = true (limit, inclusive)`, `inScopeBool 11 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `years ≤ 10` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第一条の四(3)3の贈与前十年以内のいずれかの時において施行地に住所を有していたことがある者をいうという参照上の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2238 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（住所の有無・国籍の事実認定・他号他項・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax73_18ReportWithin10Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の十八 (Num 73_18), paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_18/Article#73_18/Paragraph#4/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|a5d108751080cdfbc7272fbe51649d4dfcd34f507362be364231da7ff95df3f9` (kind REFERENCE).
- Needle 「市町村長は、前項の規定による申告書若しくは報告書を受け取つた場合又は自ら不動産の取得の事実を発見した場合には、その日から十日以内に当該申告書若しくは報告書を道府県知事に送付し、又は当該取得の事実を通知するものとする。」;
  その日から十日以内 is INCLUSIVE (`≤`), so 10 is inside and 11 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 9 = true`, `inScopeBool 10 = true (limit, inclusive)`, `inScopeBool 11 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 10` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十三条の十八(4)の申告書等を受け取つた日から十日以内に道府県知事に送付し又は事実を通知するという参照上の期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2238 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（受領自体・取得事実の発見の認定・送付先の手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax404TwoMunicipalitiesJointAppointment.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四百四条 (Num 404), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:404/Article#404/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|775a6e93492ee648d8ba2302948452c1e61ddd189950a9f024e76b3543825ce0` (kind CONDITION).
- Needle 「二以上の市町村の長は、当該市町村の議会の同意を得て、その協議によつて協同して同一の者を当該各市町村の固定資産評価員に選任することができる。」;
  二以上の市町村 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ municipalities` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四百四条(3)の二以上の市町村の長が議会の同意を得て協同して同一の固定資産評価員を選任できるという下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2238 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（議会の同意・協議の手続・被選任者の適格性・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax349_5TwoLargeAssetsMerger.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百四十九条の五 (Num 349_5), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:349_5/Article#349_5/Paragraph#1/ParagraphSentence/Sentence#2`.
- Normative unit `NORM|0d8980dbdfe9978576e18a7ef8a66da0448cc905b0bbbe89b55373b5fa9601a1` (kind DEEMING).
- Needle 「この場合において、一の納税義務者が一の市町村の区域内において第一適用年度を同じくする二以上の新設大規模償却資産を所有するときは、これらの新設大規模償却資産を合わせて一の新設大規模償却資産とみなす。」;
  二以上の新設大規模償却資産 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ assets` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三百四十九条の五(1)の二以上の新設大規模償却資産を合わせて一の新設大規模償却資産とみなす下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2238 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（区域内・適用年度の認定・合算後の価格算定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax321_7_4TwoAnnuityPaymentsDelegation.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百二十一条の七の四 (Num 321_7_4), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:321_7_4/Article#321_7_4/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|a4da9283f98a623368f304ac04defb7113c9a3cc034983bc981c243985158c9b` (kind DELEGATION).
- Needle 「前項の場合において、市町村は、同一の特別徴収対象年金所得者について老齢等年金給付が二以上あるときは、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について年金所得に係る特別徴収税額を徴収させるものとする。」;
  老齢等年金給付が二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ payments` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三百二十一条の七の四(2)の同一の年金所得者について老齢等年金給付が二以上ある場合に政令で定める一の給付に徴収させる委任上の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2238 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前項の認定・政令の内容・給付の具体的指定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2235 unique imports; `lake build` completed
  successfully (2238 jobs).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 700/700 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
