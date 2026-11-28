# Adversarial review — batch 321

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshot of 地方税法
(law 325AC0000000226). No human legal approval is recorded here; every unit
remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880,275,371 bytes;
40,287 `NOT_STARTED` records; 627 candidates cached under gitignored
`build/batch321_candidates.json`). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars) and a threshold marker (以上 / 以下 / 超え / 以内 / をこえ).

The strict single-numeral-attached-to-marker pool for these two laws was
EXHAUSTED after batches 315/317/319: the only two surviving strict candidates
were 地方税法 art. 154 「最大積載量が一トンを超え、二トン以下のもの」, which was
REJECTED (competing 一トンを超え lower bound and two scoped hits under its table
`source_path`, already rejected in batches 315/317/319). Several further
shortlisted candidates FAILED duplicate/threshold filtering and were REPLACED:
地方税法 art. 154 「総排気量が一リットルを超え、一・五リットル以下のもの」 and
「一・五リットルを超えるもの」 (fractional 一・五 with competing 一リットル lower
bound), 地方税法 art. 34 / art. 314_2 「二万八千円を超える場合には、二万八千円」
(already modelled by `LocalInsuranceDeduction.lean`, rejected in batch 319),
地方税法 art. 259 「道府県法定外普通税 … 十分の一を継続的に超える」 (already
modelled by `LocalTaxOutsideTaxTenthThreshold.lean`), and the many
「五十万円以下の罰金」 / 「三百万円を超える部分」 clause variants whose exact
needles are already pinned in the transcription checks. None of the five
finalised units failed: each needle is absent from `JapanTaxLaw/*.lean`, the
transcription checks, the check registry and the durable pins (verified by a
precise whole-needle search, not merely a substring match).

Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` (625 modules) and `tq.build_tasks` for
each law (38,410 tasks), and confirming verifiable kind, empty
`unhandled_conditions`, no UNRESOLVED unit, `clause_correspondence` True with
basis `spec numerals / rate ratio in clause`, unit text inside
`scoped_article_text(law, article, needles)`, coverage exact + unique ids, a
source path, SHA-256 pin, revision match, and verbatim law/revision/needle
presence in the article + paragraph of the raw JSON (one scoped hit). All five
units passed (see `build/prevalidate321.out`). The generated Spec.lean files
were re-checked so that statutory literals live only inside `def specInScope`
before the first `theorem ` marker, with an independent formula (no
implementation identifier), a universal axiom-free bridge, a Decidable Bool
mirror, and >=3 distinct kernel-decided boundary categories in every module
(5 in every module). Units are genuine numeric thresholds, never numeral-only
matches: two 十分の一 STRICT ratio ceilings (10 * share > total), a 五年
prescription INCLUSIVE floor, a 二年 suspension INCLUSIVE ceiling and a 百年
STRICT duration floor. 「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is
STRICT. No statutory literal 1 is used as a threshold value in any spec
(single spec literals: 10, 10, 5, 2, 100). The single-literal `百分のN` rule
does not apply to any of these units. All boundary examples are kernel-decided
(`by unfold ...; decide`, `by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax669MunicipalOutsideTaxTenthThreshold.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（市町村法定外普通税の一の納税義務者の課税標準の合計が全体の十分の一を継続的に超える STRICT 下限（10 * share > total））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2523 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（継続性の判定・総務省令の指定・議会での意見聴取手続・他項他条項は非介入）,
  U（人間の法的レビューなし、割合要件・継続性の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 669, paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:669/Article#669/Paragraph#2/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|249880341d49f5964b82636c9c5e437fcad90066e66ed829c5843e4eeb181bb7` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「市町村は、当該市町村の市町村法定外普通税の一の納税義務者（納税義務者となるべき者を含む。以下本項において同じ。）であつて当該納税義務者に対して課すべき当該市町村法定外普通税の課税標準の合計が当該市町村法定外普通税の課税標準の合計の十分の一を継続的に超えると見込まれる者として総務省令で定めるもの（以下本項において「特定納税義務者」という。）であるものがある場合において、当該市町村法定外普通税の新設又は変更をする旨の条例を制定しようとするときは、当該市町村の議会において、当該特定納税義務者の意見を聴くものとする。」;
  市町村法定外普通税の一の納税義務者の課税標準の合計が全体の十分の一を継続的に超える STRICT 下限（10 * share > total）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 100 = false (zero), inScopeBool 9 100 = false (threshold_below / small_input), inScopeBool 10 100 = false (threshold_at, STRICT: equality excluded), inScopeBool 11 100 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `10 * share > total` from statutory literals only
  (single literal 10, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax731PurposeTaxTenthThreshold.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（法定外目的税の一の納税義務者の課税標準の合計が全体の十分の一を継続的に超える STRICT 下限（10 * share > total））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2523 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（継続性の判定・総務省令の指定・議会での意見聴取手続・他項他条項は非介入）,
  U（人間の法的レビューなし、割合要件・継続性の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 731, paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:731/Article#731/Paragraph#3/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|5f99bf7a968ccac0ca19b0ae313bf2db67527e30f67aeced113471467aaf2ec8` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「道府県又は市町村は、当該道府県又は市町村の法定外目的税の一の納税義務者（納税義務者となるべき者を含む。以下本項において同じ。）であつて当該納税義務者に対して課すべき当該法定外目的税の課税標準の合計が当該法定外目的税の課税標準の合計の十分の一を継続的に超えると見込まれる者として総務省令で定めるもの（以下本項において「特定納税義務者」という。）であるものがある場合において、当該法定外目的税の新設又は変更をする旨の条例を制定しようとするときは、当該道府県又は市町村の議会において、当該特定納税義務者の意見を聴くものとする。」;
  法定外目的税の一の納税義務者の課税標準の合計が全体の十分の一を継続的に超える STRICT 下限（10 * share > total）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 100 = false (zero), inScopeBool 9 100 = false (threshold_below / small_input), inScopeBool 10 100 = false (threshold_at, STRICT: equality excluded), inScopeBool 11 100 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `10 * share > total` from statutory literals only
  (single literal 10, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax18FiveYearPrescription.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（地方税の徴収権の五年間不行使による時効消滅の INCLUSIVE 下限（years >= 5））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2523 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（法定納期限の算定・各号の特例・時効中断・他項他条項は非介入）,
  U（人間の法的レビューなし、時効期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 18, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:18/Article#18/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|b2ea03626a996a14d2dd2dd368d7e8a512068e368c0ff320345fbeee8db4b191` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「地方団体の徴収金の徴収を目的とする地方団体の権利（以下この款において「地方税の徴収権」という。）は、法定納期限（次の各号に掲げる地方団体の徴収金については、それぞれ当該各号に定める日）の翌日から起算して五年間行使しないことによつて、時効により消滅する。」;
  地方税の徴収権の五年間不行使による時効消滅の INCLUSIVE 下限（years >= 5）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input / threshold_below), inScopeBool 4 = false (threshold_below), inScopeBool 5 = true (threshold_at, INCLUSIVE), inScopeBool 6 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years >= 5` from statutory literals only
  (single literal 5, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax18_2TwoYearSuspension.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（不正行為による地方税に係る時効の二年間の進行停止の INCLUSIVE 上限（years <= 2））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2523 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（延滞金・加算金の取扱い・法定納期限の算定・時効中断・他項他条項は非介入）,
  U（人間の法的レビューなし、時効停止期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 18_2, paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:18_2/Article#18_2/Paragraph#3/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|c6c6ebfe3b65f96cd41b54b0d44d36c4e527eed0c0098cad3c4793389b8bc5fe` (kind REFERENCE); dependency-free and `NOT_STARTED`.

- Needle 「地方税の徴収権で、偽りその他不正の行為によりその全部若しくは一部の税額を免れ、又はその全部若しくは一部の税額の還付を受けた地方税（当該地方税に係る延滞金及び加算金を含む。以下この項において同じ。）に係るものの時効は、当該地方税の前条第一項に規定する法定納期限の翌日から起算して二年間は、進行しない。」;
  不正行為による地方税に係る時効の二年間の進行停止の INCLUSIVE 上限（years <= 2）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), inScopeBool 1 = true (small_input / threshold_below), inScopeBool 2 = true (threshold_at, INCLUSIVE), inScopeBool 3 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 2` from statutory literals only
  (single literal 2, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax343LongerThanHundredYearsSurfaceRight.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（百年より永い存続期間の地上権の目的である土地の質権者・地上権者を所有者とする STRICT 下限（years > 100））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2523 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（質権の他の要件・固定資産税の課税標準・他号他項他条項は非介入）,
  U（人間の法的レビューなし、存続期間要件の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 343, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:343/Article#343/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|38c6308f1da74431fc901ff760588d1b6224bbbc394f516a5795b4f34200a43a` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「固定資産税は、固定資産の所有者（質権又は百年より永い存続期間の定めのある地上権の目的である土地については、その質権者又は地上権者とする。以下固定資産税について同様とする。）に課する。」;
  百年より永い存続期間の地上権の目的である土地の質権者・地上権者を所有者とする STRICT 下限（years > 100）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input / threshold_below), inScopeBool 99 = false (threshold_below), inScopeBool 100 = false (threshold_at, STRICT: equality excluded), inScopeBool 101 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years > 100` from statutory literals only
  (single literal 100, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2520 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2523 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 795/795 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
