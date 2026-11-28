# Adversarial review — batch 319

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshots of 相続税法
(law 325AC0000000073) and 地方税法 (law 325AC0000000226). No human legal
approval is recorded here; every unit remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880,275,631 bytes;
40,297 `NOT_STARTED` records; 637 candidates cached under gitignored
`build/batch319_candidates.json`). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars), a threshold marker (以上 / 以下 / 超え / 以内 / をこえ) and exactly
one distinct kanji numeral >= 2 in the text.

Existing `JapanTaxLaw/*.lean`, the transcription checks,
`data/TRANSCRIPTION_CHECK_REGISTRY.json` and the durable transcription pins were
searched first. Several shortlisted candidates FAILED duplicate/threshold
filtering and were REPLACED: 地方税法 art. 154 「最大積載量が一トンを超え、
二トン以下のもの」 (needle hits in the scoped article + paragraph = 0 under its
table `source_path`; this also carries a competing 一トンを超え lower bound),
相続税法 art. 19 「相続開始前七年以内に贈与があつた場合の相続税額」 (a caption whose
substance is already modelled by `GiftAddBack.lean`), 地方税法 art. 34/314_2
「二万八千円を超える場合には、二万八千円」 (already modelled by
`LocalInsuranceDeduction.lean`) and 地方税法 art. 314_2
「二百万円を超える場合には、二百万円」 (already modelled by
`MedicalExpenseDeduction.lean`). None of the five finalised units failed.
Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` and `tq.build_tasks` for each law, and
confirming verifiable kind, empty `unhandled_conditions`, no UNRESOLVED unit,
`clause_correspondence` True with basis `spec numerals / rate ratio in clause`,
unit text inside `scoped_article_text(law, article, needles)`, coverage exact +
unique ids, a source path, SHA-256 pin, revision match, and verbatim
law/revision/needle presence in the article + paragraph of the raw JSON (one
scoped hit). The generated Spec.lean files were re-checked so that statutory
literals live only inside `def specInScope` before the first `theorem ` marker,
with an independent formula (no implementation identifier), a universal
axiom-free bridge, a Decidable Bool mirror, and 8 kernel-decided examples
covering 5 distinct boundary categories in every module.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT. No statutory
literal 1 is used as a threshold value in any spec (single spec literals: 6,
70, 12000, 60, 60). The single-literal `百分のN` ceiling/floor is used only where
N/100 is exactly the clause rate: the two donation-usage units use
`百分の六十` and 60/100 is exactly the clause rate. All boundary examples are
kernel-decided (`by unfold ...; decide`, `by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax23_2SixMonthFraction.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（建築後経過年数の六月以上の端数を一年とする INCLUSIVE 下限（months >= 6））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2508 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（耐用年数そのものの算定・六月未満の切り捨て・存続年数の算定・他号他項他条項は非介入）,
  U（人間の法的レビューなし、端数処理の法的評価・他条項は未判定）。

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`, SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article Num 23_2, paragraph 1 (本則),
  `LawBody[3]/MainProvision/MainProvision[2]/Article:23_2/Article#23_2/Paragraph#1/Item#2/Subitem1#1/Subitem1Sentence/Sentence#1`.

- Normative unit `NORM|691d95b85eebea0ca57029103083a4bf3968d82da61e0e936a9df2caba09253c` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「当該配偶者居住権の目的となつている建物の耐用年数（所得税法の規定に基づいて定められている耐用年数に準ずるものとして政令で定める年数をいう。ロにおいて同じ。）から建築後の経過年数（六月以上の端数は一年とし、六月に満たない端数は切り捨てる。ロにおいて同じ。）及び当該配偶者居住権の存続年数（当該配偶者居住権が存続する年数として政令で定める年数をいう。次号において同じ。）を控除した年数」;
  建築後経過年数の六月以上の端数を一年とする INCLUSIVE 下限（months >= 6）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input / threshold_below), inScopeBool 5 = false (threshold_below), inScopeBool 6 = true (threshold_at, INCLUSIVE), inScopeBool 7 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `months >= 6` from statutory literals only
  (single literal 6, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax75_2Age70OrMore.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（年齢七十歳以上の者という INCLUSIVE 下限（age >= 70））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2508 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（控除対象扶養親族の他の要件・老人扶養親族の区分・他項他条項は非介入）,
  U（人間の法的レビューなし、年齢要件の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 75_2, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:75_2/Article#75_2/Paragraph#1/Item#2/ItemSentence/Sentence#1`.

- Normative unit `NORM|d0afba42bad0f0e8a31897eb72ec8b88fc235eb0e5ea0c936283ce1d7bca86d6` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「年齢七十歳以上の者」;
  年齢七十歳以上の者という INCLUSIVE 下限（age >= 70）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input / threshold_below), inScopeBool 69 = false (threshold_below), inScopeBool 70 = true (threshold_at, INCLUSIVE), inScopeBool 71 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `age >= 70` from statutory literals only
  (single literal 70, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax314_2NewPersonalAnnuityPremiumUpTo12K.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（新個人年金保険料の金額の合計額が一万二千円以下である場合の INCLUSIVE 上限（premium <= 12000））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2508 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（剰余金・割戻金の控除計算・（１）及び（３）（ｉ）の区分・他項他条項は非介入）,
  U（人間の法的レビューなし、上限の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 314_2, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:314_2/Article#314_2/Paragraph#1/Item#5/Subitem1#3/Subitem2#1/Subitem3#1/Subitem3Sentence/Column#1/Sentence#1`.

- Normative unit `NORM|28e14ff1ca024c3284b32a2332860430fafbd17264214190d7585dc6ea93bc53` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「前年中に支払つた新個人年金保険料の金額の合計額（前年中において新個人年金保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は新個人年金保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて新個人年金保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（新個人年金保険料に係る部分の金額として政令で定めるところにより計算した金額に限る。）を控除した残額。以下（１）及び（３）（ｉ）において同じ。）が一万二千円以下である場合」;
  新個人年金保険料の金額の合計額が一万二千円以下である場合の INCLUSIVE 上限（premium <= 12000）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), inScopeBool 1 = true (small_input), inScopeBool 11999 = true (threshold_below), inScopeBool 12000 = true (threshold_at, INCLUSIVE), inScopeBool 12001 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `premium <= 12000` from statutory literals only
  (single literal 12000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax37_2DonationUsageAtLeast60Percent.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（寄附金活用可能額が寄附金額の百分の六十に相当する金額以上である INCLUSIVE 下限（percent >= 60））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2508 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（募集費用の算定・総務大臣の定め・指定対象期間の判定・他号他項他条項は非介入）,
  U（人間の法的レビューなし、割合要件の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 37_2, paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:37_2/Article#37_2/Paragraph#2/Item#2/Subitem1#1/Subitem1Sentence/Sentence#1`.

- Normative unit `NORM|9297c8bd00c480d2bc1941da7fe038061064e812fe4724c3c732fb82af474e7f` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「都道府県等が指定対象期間において受領する第一号寄附金の額の合計額から当該指定対象期間における第一号寄附金の募集に要する費用の額として総務大臣が定めるところにより算定した額を控除して得た額（ロにおいて「寄附金活用可能額」という。）が、当該指定対象期間において受領する第一号寄附金の額の合計額の百分の六十に相当する金額以上であること。」;
  寄附金活用可能額が寄附金額の百分の六十に相当する金額以上である INCLUSIVE 下限（percent >= 60）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input / threshold_below), inScopeBool 59 = false (threshold_below), inScopeBool 60 = true (threshold_at, INCLUSIVE), inScopeBool 61 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `percent >= 60` from statutory literals only
  (single literal 60, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax314_7DonationUsageAtLeast60PercentMunicipal.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（市町村の寄附金活用可能額が寄附金額の百分の六十に相当する金額以上である INCLUSIVE 下限（percent >= 60））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2508 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（募集費用の算定・総務大臣の定め・指定対象期間の判定・他号他項他条項は非介入）,
  U（人間の法的レビューなし、割合要件の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 314_7, paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:314_7/Article#314_7/Paragraph#2/Item#2/Subitem1#1/Subitem1Sentence/Sentence#1`.

- Normative unit `NORM|67f9fed48ed93e0efc246f9251a8cce3c17066f92929d8252c4aa3b230222772` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「都道府県等が指定対象期間において受領する第一号寄附金の額の合計額から当該指定対象期間における第一号寄附金の募集に要する費用の額として総務大臣が定めるところにより算定した額を控除して得た額（ロにおいて「寄附金活用可能額」という。）が、当該指定対象期間において受領する第一号寄附金の額の合計額の百分の六十に相当する金額以上であること。」;
  市町村の寄附金活用可能額が寄附金額の百分の六十に相当する金額以上である INCLUSIVE 下限（percent >= 60）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input / threshold_below), inScopeBool 59 = false (threshold_below), inScopeBool 60 = true (threshold_at, INCLUSIVE), inScopeBool 61 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `percent >= 60` from statutory literals only
  (single literal 60, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2505 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2508 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 790/790 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
