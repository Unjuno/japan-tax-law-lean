# Adversarial review — batch 323

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshot of 地方税法
(law 325AC0000000226). No human legal approval is recorded here; every unit
remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880275059 bytes;
40275 `NOT_STARTED` records; 398 candidates cached under gitignored
`build/batch323_candidates.json`). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars) and a threshold marker (以上 / 以下 / 超え / 以内 / をこえ).

The strict single-kanji-numeral-attached-to-marker pool for these two laws was
EXHAUSTED after batches 315/317/319/321: the only surviving strict candidate
was 地方税法 art. 154 「最大積載量が一トンを超え、二トン以下のもの」, which was
REJECTED (competing 一トンを超え lower bound and two scoped hits under its table
`source_path`, already rejected in batches 315/317/319). Several further
shortlisted candidates FAILED the mandatory pre-validation and were REPLACED:
地方税法 art. 314_2(7) 「…十年以上の期間…」 (needle absent from the scoped
article + paragraph of its Subitem table path), 地方税法 art. 349_4(1)
「人口五千人以上一万人未満の市町村」 (table-cell needle absent from the scoped
paragraph), and 地方税法 art. 349_4(2) 「大規模の償却資産が二以上…」
(spec numerals not located in the clause). All five finalised units passed:
each needle is absent from `JapanTaxLaw/*.lean`, the transcription checks, the
check registry and the durable pins (whole-needle search, not merely a substring
match).

Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` (630 modules) and `tq.build_tasks` for
地方税法 (38,410 tasks), and confirming verifiable kind, empty
`unhandled_conditions`, no UNRESOLVED unit, `clause_correspondence` True with
basis `spec numerals / rate ratio in clause`, unit text inside
`scoped_article_text(law, article, needles)`, coverage exact + unique ids, a
source path, SHA-256 pin, revision match, and verbatim law/revision/needle
presence in the article + paragraph of the raw JSON (one scoped hit). All five
units passed (`build/batch323_final_prevalidation.out`, `PRESELECT_OK`). The
generated Spec.lean files were re-checked so that statutory literals live only
inside `def specInScope` before the first `theorem ` marker, with an independent
formula (no implementation identifier), a universal axiom-free bridge, a
Decidable Bool mirror, and >=3 distinct kernel-decided boundary categories in
every module (5 in every module). Units are genuine numeric thresholds, never
numeral-only matches: 二月以内, 三月以内, 五年以下, 六人以上 and 四月以内 — each a
single kanji numeral >= 2 attached to its threshold marker. 
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT. No statutory literal 1
is used as a threshold value in any spec (single spec literals: 2, 3, 5, 6, 4).
The single-literal `百分のN` rule does not apply to any of these units. All
boundary examples are kernel-decided (`by unfold ...; decide`, `by decide`),
not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax53_2CorrectionRequestWithin2Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（国の税務官署の更正に伴い法人税額等が過大となった場合の更正の請求を更正の通知の日から二月以内 (months <= 2) とする INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2538 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（法人税額の過大となる要件・国の税務官署の更正手続・総務省令の定め・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin
  `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 53_2, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:53_2/Article#53_2/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|332bac36974d6e18bccffbaddc64ffaa2c47dc8156c9908f763a4aa4ee2e5bc8` (kind REFERENCE); dependency-free and `NOT_STARTED`.

- Needle 「前条第一項、第二項又は第三十四項の申告書を提出した法人は、当該申告書に係る法人税割額の計算の基礎となつた法人税の額について国の税務官署の更正を受けたことに伴い当該申告書に係る法人税割額の課税標準となる法人税額又は法人税割額が過大となる場合には、国の税務官署が当該更正の通知をした日から二月以内に限り、総務省令の定めるところにより、道府県知事に対し、当該法人税額又は法人税割額につき、更正の請求をすることができる。」;
  国の税務官署の更正に伴い法人税額等が過大となった場合の更正の請求を更正の通知の日から二月以内 (months <= 2) とする INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input / threshold_below), 2 = true (threshold_at, INCLUSIVE), 3 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `months <= 2` from statutory literals only
  (single literal 2, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax55_2DeferralReliefWithin3Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（徴収猶予の期間が三月以内 (months <= 3) である場合の特例の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2538 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（百万円以下の税額要件・担保を徴することができない特別の事情・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin
  `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 55_2, paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:55_2/Article#55_2/Paragraph#2/ParagraphSentence/Sentence#2`.

- Normative unit `NORM|8c095d47899bc578623b2e1cd9acb6d078f63048d0f3ac1c82036369a1e99a8b` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「ただし、その猶予に係る税額が百万円以下である場合、その猶予の期間が三月以内である場合又は担保を徴することができない特別の事情がある場合は、この限りでない。」;
  徴収猶予の期間が三月以内 (months <= 3) である場合の特例の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 2 = true (threshold_below), 3 = true (threshold_at, INCLUSIVE), 4 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `months <= 3` from statutory literals only
  (single literal 3, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax163TaxEvasionUpTo5Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（自動車税の全部又は一部を免れた場合の五年以下の拘禁刑 (years <= 5) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2538 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（百万円以下の罰金・併科・偽りその他不正の行為の認定・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin
  `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 163, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:163/Article#163/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|ebebef16e46fe15d8de1d0dbae3cf998052867ac1eaa0e68461444ad8609f324` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「偽りその他不正の行為により自動車税の全部又は一部を免れたときは、その違反行為をした者は、五年以下の拘禁刑若しくは百万円以下の罰金に処し、又はこれを併科する。」;
  自動車税の全部又は一部を免れた場合の五年以下の拘禁刑 (years <= 5) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 4 = true (threshold_below), 5 = true (threshold_at, INCLUSIVE), 6 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 5` from statutory literals only
  (single literal 5, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax768CommitteeAtLeast6Members.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（委員の定数は六人以上 (members >= 6) とする INCLUSIVE 下限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2538 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（十二人以内の上限・定款で定める手続・他の委員会規定・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin
  `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 768, paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[8]/Article:768/Article#768/Paragraph#3/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|c08eaca308e4a6bc684cb992e213f837e3ac79e747cb0cfe364582935d683f48` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「委員の定数は、六人以上十二人以内において定款で定める。」;
  委員の定数は六人以上 (members >= 6) とする INCLUSIVE 下限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), 1 = false (small_input), 5 = false (threshold_below), 6 = true (threshold_at, INCLUSIVE), 7 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `members >= 6` from statutory literals only
  (single literal 6, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax701_47BusinessClosureReturnWithin4Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（年の中途で事業を廃止した場合の申告書提出を廃止の日から四月以内 (months <= 4) とする INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2538 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（死亡による廃止の一月以内特例・翌年三月十五日までの通常提出・課税標準額・税額の記載・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin
  `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 701_47, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:701_47/Article#701_47/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|4ae30c7e6c1b069fc231a55d35aa613b425c8bd1085b75bfc7b73b3c4d1670fd` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「事業所等において個人が行う事業に対して課する事業所税の納税義務者は、その年の翌年三月十五日までに（年の中途において事業を廃止した場合には、当該事業の廃止の日から一月以内（当該事業の廃止が納税義務者の死亡によるときは、四月以内）に）、個人に係る課税期間に係る事業所税の課税標準額及び税額その他必要な事項を記載した総務省令で定める様式による申告書を当該事業所等所在の指定都市等の長に提出するとともに、その申告した税額を当該指定都市等に納付しなければならない。」;
  年の中途で事業を廃止した場合の申告書提出を廃止の日から四月以内 (months <= 4) とする INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 3 = true (threshold_below), 4 = true (threshold_at, INCLUSIVE), 5 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `months <= 4` from statutory literals only
  (single literal 4, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2535 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2538 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 800/800 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
- `MANDATORY_PREVALIDATION_ALL_OK True` — every id pre-validated before finalisation.
