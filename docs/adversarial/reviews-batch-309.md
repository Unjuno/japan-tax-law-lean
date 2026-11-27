# Adversarial review — batch 309

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshots: two from
相続税法 (law 325AC0000000073) and three from 地方税法 (law 325AC0000000226).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (candidates cached
under gitignored `build/batch309_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path traversing
MainProvision only (no 附則), short scoped text (<300 chars), and a threshold
marker (以上 / 以下 / 超え / 以内 / をこえる). The single mmap pass yielded 390
candidates; 138 carried a kanji numeral >= 2 attached to a threshold marker.
Eighteen shortlisted candidates were pre-validated: one
(地方税法 art. 349_4 「人口五千人以上一万人未満の市町村」) FAILED the verbatim
article + paragraph check (table/column pin mismatch) and was REPLACED, and
twelve further passing candidates were passed over to keep the final five
diverse and non-duplicative. During the mmap filter and selection, candidates
with competing thresholds, section-reference-only 「以下」 markers, rate
clauses (百分のN) or fractional numerals were excluded. Existing `JapanTaxLaw/*.lean`,
the transcription checks, `data/TRANSCRIPTION_CHECK_REGISTRY.json` and the
durable transcription pins were searched first; none of these five units was
previously modelled (no verbatim needle and no same-article/same-phrase unit).
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
axiom-free bridge, a Decidable Bool mirror, and >= 5 kernel-decided examples
(9-11 here) covering >= 3 distinct boundary categories (5 here).
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」/「をこえる」 are STRICT. No
statutory literal 1 is used as a threshold value in any spec (single spec
literals: 3, 100, 2, 300000, 60). The single-literal `百分のN` ceiling/floor is
used only where N/100 is exactly the clause rate (none of these five units
uses one). All boundary examples are kernel-decided (`by unfold …; decide`,
plus `inScopeBool N = bool := by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax39SurveyOver3Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第三十九条 (Num 39), paragraph 23 (本則),
  `LawBody[3]/MainProvision/MainProvision[5]/Article:39/Article#39/Paragraph#23/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|8b6ad2301459e101007e7cb127a3db0a668a9c19709eeacf3a13097a06a6d348` (kind CONDITION).
- Needle 「第二項の規定により、税務署長が、同項の調査を行う場合において、当該調査に三月を超える期間を要すると認めるときにおける同項の規定の適用については、同項中「三月」とあるのは、「六月」とする。」;
  三月を超える is STRICT (`>`), so 3 itself is outside and 4 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 2 = false` (threshold_below), `inScopeBool 3 = false` (threshold_at (STRICT: excluded)), `inScopeBool 4 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at (STRICT: excluded), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `3 < months` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二十三条（第三十九条第二十三条項）の調査に三月を超える期間を要する場合の厳密下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2433 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第二項の調査手続・「六月」への書換え・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### InheritanceTax59ReportCountAtLeast100.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第五十九条 (Num 59), paragraph 5 (本則),
  `LawBody[3]/MainProvision/MainProvision[6]/Article:59/Article#59/Paragraph#5/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|4c1f72290f8dd4d4f7b726fbf65fd38ae481b9a7064263298e374f4fe1ce7f4d` (kind EXCEPTION).
- Needle 「第一項各号、第二項又は第三項に定める調書（以下この条において単に「調書」という。）のうち、当該調書の提出期限の属する年の前々年の一月一日から十二月三十一日までの間に提出すべきであつた当該調書の枚数として財務省令で定めるところにより算出した数が百以上であるものについては、当該調書を提出すべき者は、第一項から第三項までの規定にかかわらず、当該調書に記載すべきものとされるこれらの規定に規定する事項（以下この条において「記載事項」という。）を次に掲げる方法のいずれかによりこれらの規定」;
  百以上 is INCLUSIVE (`≥`), so 100 is inside and 99 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 99 = false` (threshold_below), `inScopeBool 100 = true` (threshold_at (inclusive)), `inScopeBool 101 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `100 ≤ reports` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第五十九条(5)の調書の枚数が百以上の場合の記載事項例外の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2433 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（提出期限の年・財務省令の算出・記載方法の詳細・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax20_4_2TwoOrMoreInstallments.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十条の四の二 (Num 20_4_2), paragraph 6 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:20_4_2/Article#20_4_2/Paragraph#6/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|a23558634f33c7f610d66701423cbfe86f23628a4586a04eeeeb03835a5606ef` (kind CONDITION).
- Needle 「地方税の確定金額を、二以上の納期限を定め、一定の金額に分割して納付し、又は納入することとされている場合において、その納期限ごとの分割金額に千円未満の端数があるとき、又はその分割金額の全額が千円未満であるときは、その端数金額又はその全額は、すべて最初の納期限に係る分割金額に合算するものとする。」;
  二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 2 = true` (threshold_at), `inScopeBool 3 = true` (threshold_above) — zero, small_input, threshold_at, threshold_above (4 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `2 ≤ deadlines` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二十条の四の二(6)の納期限が二以上の場合の端数合算の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2433 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（千円未満の端数・分割金額・納付方法・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax30FalseTaxManagerFineWithin300k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三十条 (Num 30), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:30/Article#30/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|78c4b66be4df3492b588b23896bb80a6c620035b38cf0677804af0bc7f039118` (kind REFERENCE).
- Needle 「前条第一項の規定により申告すべき納税管理人について虚偽の申告をし、又は偽りその他不正の手段により同項の承認若しくは同条第二項の認定を受けたときは、その違反行為をした者は、三十万円以下の罰金に処する。」;
  三十万円以下 is INCLUSIVE (`≤`), so 300000 is inside and 300001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 299999 = true` (threshold_below), `inScopeBool 300000 = true` (threshold_at (inclusive)), `inScopeBool 300001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `yen ≤ 300000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三十条(1)の納税管理人の虚偽申告等に対する罰金三十万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2433 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（納税管理人申告・承認認定要件・違反認定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax321_15DecisionWithin60Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百二十一条の十五 (Num 321_15), paragraph 7 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:321_15/Article#321_15/Paragraph#7/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|e01d783fb8d9ceb468891417d069528301ba2d99882403c4b595b16b17549e29` (kind CONDITION).
- Needle 「総務大臣は、第四項の申出を受けた場合においては、その日から六十日以内にその裁決をしなければならない。」;
  六十日以内 is INCLUSIVE (`≤`), so 60 is inside and 61 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 59 = true` (threshold_below), `inScopeBool 60 = true` (threshold_at (inclusive)), `inScopeBool 61 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `days ≤ 60` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三百二十一条の十五(7)の総務大臣が六十日以内に裁決する場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2433 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第四項の申出要件・裁決内容・不服手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2430 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2433 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 765/765 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
