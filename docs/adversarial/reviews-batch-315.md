# Adversarial review — batch 315

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshot of 地方税法
(law 325AC0000000226, revision `325AC0000000226_20261101_508AC0000000002`).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (candidates cached
under gitignored `build/batch315_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path traversing
MainProvision only (no 附則), short scoped text (<300 chars), and a threshold
marker (以上 / 以下 / 超え / 以内 / をこえる). The single mmap pass yielded 367
candidates; 7 carried a single kanji numeral >= 2 directly attached to that
marker. One shortlisted candidate — 地方税法 art. 154 「二トン以下」 (idx 204) —
FAILED the mandatory pre-validation: its needle was not verbatim/unique in the
scoped article + paragraph and it had a competing 一トンを超え threshold. It was
REPLACED; the five finalised candidates all passed. Existing
`JapanTaxLaw/*.lean`, the transcription checks,
`data/TRANSCRIPTION_CHECK_REGISTRY.json` and the durable transcription pins were
searched first; none of these five units was previously modelled (no verbatim
needle and no same-article/same-phrase unit — the adjacent 15k–40k / 56k / 70k
bands are distinct units). Each candidate was then pre-validated by importing
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
covering 5 distinct boundary categories. 「以上」/「以下」/「以内」 are INCLUSIVE;
「を超える」/「をこえる」 are STRICT. No statutory literal 1 is used as a threshold
value in any spec (single spec literals: 12000, 15000, 5). The single-literal
`百分のN` ceiling/floor is used only where N/100 is exactly the clause rate
(none of these five units uses one). All boundary examples are kernel-decided
(`by unfold …; decide`, `by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax34NewLifeInsurancePremiumUpTo12K.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三十四条 (Num 34), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:34/Article#34/Paragraph#1/Item#5/Subitem1#1/Subitem2#1/Subitem3#1/Subitem3Sentence/Column#1/Sentence#1`.

- Normative unit `NORM|d53f9d63efdb541fbc777a5c5bcdc32ac1d9c82690e14e2f4c4bd8d87e6e122d` (kind DELEGATION).

- Needle 「前年中に支払つた新生命保険料の金額の合計額（前年中において新生命保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は新生命保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて新生命保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（新生命保険料に係る部分の金額として政令で定めるところにより計算した金額に限る。）を控除した残額。以下（１）及び（３）（ｉ）において同じ。）が一万二千円以下である場合」;
  一万二千円以下 is INCLUSIVE (`≤`), so 12000 is inside and 12001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.

- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 11999 = true` (threshold_below), `inScopeBool 12000 = true` (threshold_at (inclusive)), `inScopeBool 12001 = false` (threshold_above) — 5 distinct categories,
  all kernel-decided.

- Independent spec states the bound as `premium <= 12000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.

- H/T/D/C/U: H（第三十四条(1)の新生命保険料の金額の合計額が一万二千円以下である場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2478 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（剰余金・割戻金の控除計算・（１）及び（３）（ｉ）の区分・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax34OldLifeInsurancePremiumUpTo15K.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三十四条 (Num 34), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:34/Article#34/Paragraph#1/Item#5/Subitem1#1/Subitem2#2/Subitem3#1/Subitem3Sentence/Column#1/Sentence#1`.

- Normative unit `NORM|23d251253d3d6ab3f9f6fec2b264e0793bef65ba733f0e1194108aecbe04e51d` (kind CONDITION).

- Needle 「前年中に支払つた旧生命保険料の金額の合計額（前年中において旧生命保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は旧生命保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて旧生命保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（旧生命保険料に係る部分の金額に限る。）を控除した残額。以下（２）及び（３）（ｉｉ）において同じ。）が一万五千円以下である場合」;
  一万五千円以下 is INCLUSIVE (`≤`), so 15000 is inside and 15001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.

- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 14999 = true` (threshold_below), `inScopeBool 15000 = true` (threshold_at (inclusive)), `inScopeBool 15001 = false` (threshold_above) — 5 distinct categories,
  all kernel-decided.

- Independent spec states the bound as `premium <= 15000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.

- H/T/D/C/U: H（第三十四条(1)の旧生命保険料の金額の合計額が一万五千円以下である場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2478 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（剰余金・割戻金の控除計算・（２）及び（３）（ｉｉ）の区分・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax34NursingCarePremiumUpTo12K.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三十四条 (Num 34), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:34/Article#34/Paragraph#1/Item#5/Subitem1#2/Subitem2#1/Subitem2Sentence/Column#1/Sentence#1`.

- Normative unit `NORM|316ccecf8d56824e094d1a4d78c5b7f1ebbf86be708415f393db7edda3a883cb` (kind DELEGATION).

- Needle 「前年中に支払つた介護医療保険料の金額の合計額（前年中において介護医療保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は介護医療保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて介護医療保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（介護医療保険料に係る部分の金額として政令で定めるところにより計算した金額に限る。）を控除した残額。以下ロにおいて同じ。）が一万二千円以下である場合」;
  一万二千円以下 is INCLUSIVE (`≤`), so 12000 is inside and 12001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.

- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 11999 = true` (threshold_below), `inScopeBool 12000 = true` (threshold_at (inclusive)), `inScopeBool 12001 = false` (threshold_above) — 5 distinct categories,
  all kernel-decided.

- Independent spec states the bound as `premium <= 12000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.

- H/T/D/C/U: H（第三十四条(1)の介護医療保険料の金額の合計額が一万二千円以下である場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2478 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（剰余金・割戻金の控除計算・ロの区分・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax34OldPersonalAnnuityPremiumUpTo15K.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三十四条 (Num 34), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:34/Article#34/Paragraph#1/Item#5/Subitem1#3/Subitem2#2/Subitem3#1/Subitem3Sentence/Column#1/Sentence#1`.

- Normative unit `NORM|d6e5b28be3c23145ec6c6ea52f5d657e6566716fb1ee451f759d2b6a2d7dd1b5` (kind CONDITION).

- Needle 「前年中に支払つた旧個人年金保険料の金額の合計額（前年中において旧個人年金保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は旧個人年金保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて旧個人年金保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（旧個人年金保険料に係る部分の金額に限る。）を控除した残額。以下（２）及び（３）（ｉｉ）において同じ。）が一万五千円以下である場合」;
  一万五千円以下 is INCLUSIVE (`≤`), so 15000 is inside and 15001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.

- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 14999 = true` (threshold_below), `inScopeBool 15000 = true` (threshold_at (inclusive)), `inScopeBool 15001 = false` (threshold_above) — 5 distinct categories,
  all kernel-decided.

- Independent spec states the bound as `premium <= 15000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.

- H/T/D/C/U: H（第三十四条(1)の旧個人年金保険料の金額の合計額が一万五千円以下である場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2478 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（剰余金・割戻金の控除計算・（２）及び（３）（ｉｉ）の区分・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax73_27_6RealEstateTaxDeferralWithin5Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の二十七の六 (Num 73_27_6), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_27_6/Article#73_27_6/Paragraph#2/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|b42f738e6ba9ca28a29e93d26cd569610fb7fc4f7952a7e9fd31649cd068c41b` (kind REFERENCE).

- Needle 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から五年以内の期間（当該不動産が同項に規定する土地改良事業に係るものである場合には、同日から同項に規定する一年を経過する日までの期間）を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」;
  五年以内 is INCLUSIVE (`≤`), so 5 is inside and 6 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.

- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 4 = true` (threshold_below), `inScopeBool 5 = true` (threshold_at (inclusive)), `inScopeBool 6 = false` (threshold_above) — 5 distinct categories,
  all kernel-decided.

- Independent spec states the bound as `years <= 5` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.

- H/T/D/C/U: H（第七十三条の二十七の六(2)の不動産取得税の徴収猶予期間の取得日から五年以内の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2478 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（条例で定める申告・真実性判定・土地改良事業の一年特例・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2475 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2478 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 780/780 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
