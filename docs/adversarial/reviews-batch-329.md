# Adversarial review — batch 329

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshot of 地方税法
(law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880275059 bytes;
40275 `NOT_STARTED` records; 398 candidates cached under gitignored
`build/batch329_candidates.json`). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars) and a threshold marker (以上 / 以下 / 超え / 以内 / をこえ).

Candidates that FAILED the mandatory pre-validation were REPLACED, never
promoted: 地方税法 art. 349_4(2) 「…大規模の償却資産が二以上…百分の百六十…」
and art. 349_5(3) 「…二以上の第一次新設大規模償却資産…」 (spec numerals not in
the clause, basis not `spec numerals / rate ratio in clause`), art. 154
table cells such as 「（２）　最大積載量が一トンを超え、二トン以下のもの」
(needle absent from the scoped article + paragraph of the table `source_path`),
art. 314_4(1) 「百分の八・四を超えることができない」 (rate fragment), and the
相続税法 art. 38/52 「十分の五以上」 ratio fragments (a 5/10 ratio, not a
standalone literal 5). Near-duplicate matches were also rejected: art. 358(1)
「…固定資産税の全部又は一部を免れた…五年以下の拘禁刑」 (0.9615 similarity to
the already-modelled 鉱区税 / 自動車税 five-year evasion units), art. 321_8_2(1)
「…更正の通知をした日から二月以内…」 (0.9781 similarity to the already-modelled
`LocalTax53_2CorrectionRequestWithin2Months`), art. 144_22(1) ten-year
exemption-certificate fraud (0.8554 similarity to the retained art. 144_25(2)
needle), and art. 72_95(1) 「次の各号のいずれかに該当する場合には…十年以下…」
(a bare framework penalty with no described conduct — numeral-only style).
All five finalised units here carry exactly one single kanji numeral
(十 / 十 / 十 / 三 / 十, each >= 2) attached to their threshold marker, and each
whole needle is absent from `JapanTaxLaw/*.lean`, the transcription checks, the
check registry and the durable pins (whole-needle search plus a difflib
near-duplicate sweep, not merely a substring match).

Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` (645 modules at pre-selection, 650 after
the transcription yields were added) and `tq.build_tasks` for 地方税法
(38,410 tasks), and confirming verifiable kind, empty `unhandled_conditions`,
no UNRESOLVED unit, `clause_correspondence` True with basis
`spec numerals / rate ratio in clause`, unit text inside
`scoped_article_text(law, article, needles)`, coverage exact + unique ids, a
source path, SHA-256 pin, revision match, and verbatim law/revision/needle
presence in the article + paragraph of the raw JSON (one scoped hit). All five
units passed (`build/batch329_preselect.out`, `PRESELECT_OK`;
`build/batch329_final_prevalidation.out`, `MANDATORY_PREVALIDATION_ALL_OK True`).
The generated Spec.lean files were re-checked so that statutory literals live
only inside `def specInScope` before the first `theorem ` marker, with an
independent formula (no implementation identifier), a universal axiom-free
bridge, a Decidable Bool mirror, and 5 distinct kernel-decided boundary
categories in every module. Units are genuine numeric thresholds, never
numeral-only matches: 十年以下, 十年以下, 十年以下, 三年以下 and 十年以下 — each a
single kanji numeral >= 2 attached to its threshold marker. 
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT. No statutory
literal 1 is used as a threshold value in any spec (single spec literals:
10, 10, 10, 3, 10). The single-literal `百分のN` rule does not apply to any of
these units. All boundary examples are kernel-decided (`by unfold ...; decide`,
`by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax72_49_3CorpBusinessTaxEvasionUpTo10Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（法人の行う事業に対する事業税の全部又は一部を免れた場合の代表者・代理人・使用人その他の従業者の十年以下の拘禁刑 (years <= 10) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2583 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（千万円以下の罰金・併科・法人課税信託の受託者の範囲・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 72_49_3, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_49_3/Article#72_49_3/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|28ef205d48436ff2ab56707b86fa7cb09ada9e6dcdb3253cae880f6c2d8c3cd1` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「偽りその他不正の行為により法人の行う事業に対する事業税の全部又は一部を免れた場合には、法人の代表者（法人課税信託の受託者である個人を含む。第三項において同じ。）、代理人、使用人その他の従業者で、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」;
  法人の行う事業に対する事業税の全部又は一部を免れた場合の代表者・代理人・使用人その他の従業者の十年以下の拘禁刑 (years <= 10) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 9 = true (threshold_below), 10 = true (threshold_at, INCLUSIVE), 11 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 10` from statutory literals only
  (single literal 10, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax144_25ExemptOilCertTransferUpTo10Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（免税証を譲り受け免税軽油の引取りを行つた場合の十年以下の拘禁刑 (years <= 10) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2583 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（千万円以下の罰金・併科・免税証の交付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 144_25, paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:144_25/Article#144_25/Paragraph#2/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|be6f4fc2bfafea4dcda292a049cc1f967644816d68a76424c2148c8da0ead3c2` (kind REFERENCE); dependency-free and `NOT_STARTED`.

- Needle 「前条の規定に違反して免税証を譲り受け、免税軽油の引取りを行つたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」;
  免税証を譲り受け免税軽油の引取りを行つた場合の十年以下の拘禁刑 (years <= 10) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 9 = true (threshold_below), 10 = true (threshold_at, INCLUSIVE), 11 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 10` from statutory literals only
  (single literal 10, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax72_109FreightTaxEvasionUpTo10Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（貨物割の全部又は一部を免れ、又は免れようとした場合の十年以下の拘禁刑 (years <= 10) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2583 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（千万円以下の罰金・併科・貨物割の課税標準・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 72_109, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_109/Article#72_109/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|8bf883788e9e64ca692fba3bdacb6ea8f994fc8c6a6c8eeea654c79f3ef5a315` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「偽りその他不正の行為により貨物割の全部又は一部を免れ、又は免れようとしたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」;
  貨物割の全部又は一部を免れ、又は免れようとした場合の十年以下の拘禁刑 (years <= 10) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 9 = true (threshold_below), 10 = true (threshold_at, INCLUSIVE), 11 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 10` from statutory literals only
  (single literal 10, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax144_33HydrocarbonOilHandlingUpTo3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（第一項の犯罪に係る炭化水素油を情を知つて運搬・保管・取得・媒介した場合の三年以下の拘禁刑 (years <= 3) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2583 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（三百万円以下の罰金・併科・第一項の犯罪の認定・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 144_33, paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:144_33/Article#144_33/Paragraph#3/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|83c454e2e9734f7e2970522d2abfb8f009346d40b02c93c42b665fd54bcd746b` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「第一項の犯罪に係る炭化水素油について、情を知つてこれを運搬し、保管し、有償若しくは無償で取得し、又は処分の媒介若しくはあつせんをしたときは、その違反行為をした者は、三年以下の拘禁刑若しくは三百万円以下の罰金に処し、又はこれを併科する。」;
  第一項の犯罪に係る炭化水素油を情を知つて運搬・保管・取得・媒介した場合の三年以下の拘禁刑 (years <= 3) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 2 = true (threshold_below), 3 = true (threshold_at, INCLUSIVE), 4 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 3` from statutory literals only
  (single literal 3, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax72_60IndividualBusinessTaxEvasionUpTo10Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（個人の行う事業に対する事業税の全部又は一部を免れた場合の十年以下の拘禁刑 (years <= 10) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2583 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（千万円以下の罰金・併科・事業税の課税標準・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 72_60, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_60/Article#72_60/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|0aecf0144b3b93d48ad0684c2f29b26e079395cfc20b1182881b836673d21494` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「偽りその他不正の行為により個人の行う事業に対する事業税の全部又は一部を免れたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」;
  個人の行う事業に対する事業税の全部又は一部を免れた場合の十年以下の拘禁刑 (years <= 10) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 9 = true (threshold_below), 10 = true (threshold_at, INCLUSIVE), 11 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 10` from statutory literals only
  (single literal 10, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2580 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2583 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 815/815 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
- `MANDATORY_PREVALIDATION_ALL_OK True` — every id pre-validated before finalisation.
