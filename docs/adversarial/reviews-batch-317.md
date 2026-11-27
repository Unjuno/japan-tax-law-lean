# Adversarial review — batch 317

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshots of 相続税法
(law 325AC0000000073) and 地方税法 (law 325AC0000000226). No human legal
approval is recorded here; every unit remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880,276,125 bytes;
41,185 in-scope tasks decoded; candidates cached under gitignored
`build/batch317_candidates.json`: 639 candidates). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars), a threshold marker (以上 / 以下 / 超え / 以内) and exactly one
distinct kanji numeral >= 2 (二 or 十) directly attached to that marker.
Existing `JapanTaxLaw/*.lean`, transcription checks,
`data/TRANSCRIPTION_CHECK_REGISTRY.json` and the durable transcription pins
were searched first. Several shortlisted units FAILED duplicate/threshold
filtering and were REPLACED: 地方税法 art. 154 「二トン以下」 (competing
一トンを超え threshold, previously rejected in batch 315), 地方税法 art. 72_80
「受益者が二以上」 (same phrase already modelled as LocalTax72_3TwoOrMoreBeneficiaries
and LocalTax24_3BeneficiariesTwoOrMoreDelegation), and 地方税法 art. 314_7 「三年以内」 (same phrase already
modelled as LocalTax37_2DesignationBanWithin3Years). None of the five
finalised units failed. Each candidate was then pre-validated by importing
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
covering >=3 distinct boundary categories (5 in every module).
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT. No statutory
literal 1 is used as a threshold value in any spec (single spec literals: 2, 2,
2, 2, 10). The single-literal `百分のN` ceiling/floor is used only where N/100
is exactly the clause rate (none of these five units uses one). All boundary
examples are kernel-decided (`by unfold ...; decide`, `by decide`), not asserted
by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceFamilyDirectorHalfCeiling.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（同族理事の数が理事の総数の二分の一を超える（STRICT））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2493 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同族理事・理事の定義、相続開始直後の判定、他号他項他条項は非介入）,
  U（人間の法的レビューなし、割合の法的評価・他条項は未判定）。

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`, SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article Num 66_2, paragraph 2 (本則),
  `LawBody[3]/MainProvision/MainProvision[6]/Article:66_2/Article#66_2/Paragraph#2/Item#3/Subitem1#1/Subitem1Sentence/Sentence#1`.

- Normative unit `NORM|a786da436570ed3ab31a2b421051c4cab3a3728e0c20d9f3e9dad0b3463e06ac` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「被相続人の相続開始の直前における当該被相続人に係る同族理事の数の理事の総数のうちに占める割合が二分の一を超えること。」;
  同族理事の数が理事の総数の二分の一を超える（STRICT）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 4 = false (zero), inScopeBool 1 4 = false (threshold_below / small_input), inScopeBool 2 4 = false (threshold_at, STRICT: equality excluded), inScopeBool 3 4 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `2 * familyDirectors > allDirectors` from statutory literals only
  (single literal 2, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTaxProvisionalTaxHalfCap.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（徴収できる額の総額が仮算定税額の二分の一に相当する額を超える（STRICT上限））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2493 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（ただし書の徴収手続、仮算定税額の算定、他項他条項は非介入）,
  U（人間の法的レビューなし、上限の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 364, paragraph 5 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:364/Article#364/Paragraph#5/ParagraphSentence/Sentence#2`.

- Normative unit `NORM|2d8c039384a0dda8f28a1455c4573a32d7abb76555d4d6ce1d6a58a8973fdcfc` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「ただし、当該徴収することができる額の総額は、仮算定税額の二分の一に相当する額を超えることができない。」;
  徴収できる額の総額が仮算定税額の二分の一に相当する額を超える（STRICT上限）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 4 = false (zero), inScopeBool 1 4 = false (threshold_below / small_input), inScopeBool 2 4 = false (threshold_at, STRICT: equality excluded), inScopeBool 3 4 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `2 * amount > base` from statutory literals only
  (single literal 5, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTaxNationalHealthTaxHalfCap.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（徴収できる額の総額が前年度の国民健康保険税額の二分の一に相当する額を超える（STRICT上限））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2493 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（ただし書の徴収手続、前年度税額の算定、他項他条項は非介入）,
  U（人間の法的レビューなし、上限の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 706_2, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:706_2/Article#706_2/Paragraph#1/ParagraphSentence/Sentence#2`.

- Normative unit `NORM|6fea74743aca3042f6cc13b94ddfba3775cd8187b59af515b5f29c0aff417227` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「ただし、当該徴収することができる額の総額は、前年度の国民健康保険税額の二分の一に相当する額を超えることができない。」;
  徴収できる額の総額が前年度の国民健康保険税額の二分の一に相当する額を超える（STRICT上限）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 4 = false (zero), inScopeBool 1 4 = false (threshold_below / small_input), inScopeBool 2 4 = false (threshold_at, STRICT: equality excluded), inScopeBool 3 4 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `2 * amount > base` from statutory literals only
  (single literal 1, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTaxExpropriationTwoYearWindow.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（移転補償金契約日から二年以内（INCLUSIVE、years <= 2））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2493 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（市町村長の認定、政令で定める土地、被買収不動産等の定義、他項他条項は非介入）,
  U（人間の法的レビューなし、期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 602, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:602/Article#602/Paragraph#1/Item#3/ItemSentence/Column#2/Sentence#1`.

- Normative unit `NORM|52fd38ecc15ffe874209fe3863cd13a4b224b3996d92756f3726c4fb7c38a776` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「これらの者が公共事業を行う者に代わつて当該公共事業の用に供する不動産を取得する場合においてこれらの者に当該公共事業の用に供する不動産を譲渡した者又は当該譲渡に係る土地の上に建築されていた家屋について移転補償金を受けた者に対する当該譲渡し、又は移転補償金を受けた不動産（以下この号において「被買収不動産等」という。）に代わるものと市町村長が認める土地（当該被買収不動産等に対応するものとして政令で定める土地に限る。）の譲渡（当該不動産を譲渡し、又は当該家屋についての移転補償金に係る契約をした日から二年以内に行われる土地の譲渡に限る。）」;
  移転補償金契約日から二年以内（INCLUSIVE、years <= 2）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), inScopeBool 1 = true (small_input / threshold_below), inScopeBool 2 = true (threshold_at, INCLUSIVE), inScopeBool 3 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 2` from statutory literals only
  (single literal 1, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTaxOutsideTaxTenthThreshold.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（一の納税義務者の課税標準の合計が全体の十分の一を継続的に超える（STRICT））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2493 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（継続性の判定、総務省令の指定、議会での意見聴取手続、他項他条項は非介入）,
  U（人間の法的レビューなし、十分の一の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 259, paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:259/Article#259/Paragraph#2/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|84346179637146b0685514266131464c6b975d789aba521d6833c4cd9cf83523` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「道府県は、当該道府県の道府県法定外普通税の一の納税義務者（納税義務者となるべき者を含む。以下本項において同じ。）であつて当該納税義務者に対して課すべき当該道府県法定外普通税の課税標準の合計が当該道府県法定外普通税の課税標準の合計の十分の一を継続的に超えると見込まれる者として総務省令で定めるもの（以下本項において「特定納税義務者」という。）であるものがある場合において、当該道府県法定外普通税の新設又は変更をする旨の条例を制定しようとするときは、当該道府県の議会において、当該特定納税義務者の意見を聴くものとする。」;
  一の納税義務者の課税標準の合計が全体の十分の一を継続的に超える（STRICT）. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 100 = false (zero), inScopeBool 9 100 = false (threshold_below / small_input), inScopeBool 10 100 = false (threshold_at, STRICT: equality excluded), inScopeBool 11 100 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `10 * taxpayerBase > totalBase` from statutory literals only
  (single literal 2, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2490 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2493 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 785/785 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
