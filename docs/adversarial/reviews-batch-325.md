# Adversarial review — batch 325

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshots of 相続税法
(law 325AC0000000073) and 地方税法 (law 325AC0000000226). No human legal
approval is recorded here; every unit remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880275059 bytes;
40275 `NOT_STARTED` records; 398 candidates cached under gitignored
`build/batch325_candidates.json`). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars) and a threshold marker (以上 / 以下 / 超え / 以内 / をこえ).

Candidates that FAILED the mandatory pre-validation were REPLACED, never
promoted: 地方税法 art. 154 table cells such as 「総排気量が一リットルを超え、
一・五リットル以下のもの」 (needle absent from the scoped article + paragraph of
its table `source_path`, zero scoped hits), the rate clauses art. 314_4(1)
「百分の八・四を超えることができない」, art. 321(3) 「百分の一に…十四日以下」,
art. 350(2) 「三分の二を超える…百分の一・七」 and art. 349_4 「大規模の償却資産が
二以上…」 (spec numerals not located in the clause, basis not
`spec numerals / rate ratio in clause`), the standalone 十分の五以上 ratio
fragments of 相続税法 art. 38/52 (a 5/10 ratio, not a standalone literal 5),
and the 地方税法 art. 144 「〇・八〇一七を超え」 fractional artifact (a digit
inside a decimal, not a threshold). The strict single-kanji pool for these two
laws had already been exhausted by earlier batches; all five finalised units
here carry exactly one single kanji digit (>= 2) attached to their threshold
marker, and each whole needle is absent from `JapanTaxLaw/*.lean`, the
transcription checks, the check registry and the durable pins (whole-needle
search, not merely a substring match).

Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` (635 modules at pre-selection, 640 after
the transcription yields were added) and `tq.build_tasks` for 地方税法
(38,410 tasks) and 相続税法 (2,775 tasks), and confirming verifiable kind,
empty `unhandled_conditions`, no UNRESOLVED unit, `clause_correspondence` True
with basis `spec numerals / rate ratio in clause`, unit text inside
`scoped_article_text(law, article, needles)`, coverage exact + unique ids, a
source path, SHA-256 pin, revision match, and verbatim law/revision/needle
presence in the article + paragraph of the raw JSON (one scoped hit). All five
units passed (`build/batch325_preselect.out`, `PRESELECT_OK`;
`build/batch325_final_prevalidation.out`, `MANDATORY_PREVALIDATION_ALL_OK True`).
The generated Spec.lean files were re-checked so that statutory literals live
only inside `def specInScope` before the first `theorem ` marker, with an
independent formula (no implementation identifier), a universal axiom-free
bridge, a Decidable Bool mirror, and 5 distinct kernel-decided boundary
categories in every module. Units are genuine numeric thresholds, never
numeral-only matches: 三年以内, 四年以内, 二以上, 二年以下 and 五年以下 — each a
single kanji numeral >= 2 attached to its threshold marker. 
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT. No statutory
literal 1 is used as a threshold value in any spec (single spec literals:
3, 4, 2, 2, 5). The single-literal `百分のN` rule does not apply to any of
these units. All boundary examples are kernel-decided (`by unfold ...; decide`,
`by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax19_2PartitionWithin3Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（分割されていない財産を申告期限から三年以内 (months <= 3) に分割する場合の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2553 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（四月以内のやむを得ない事情の例外・政令で定める日の認定・訴えの提起の有無・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`, SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article Num 19_2, paragraph 2 (本則),
  `LawBody[3]/MainProvision/MainProvision[1]/Article:19_2/Article#19_2/Paragraph#2/ParagraphSentence/Sentence#2`.

- Normative unit `NORM|d867915d1db8ebc39b44e08d9a107a2d9d05de1aa6140ce3e1a51297b2eca514` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「ただし、その分割されていない財産が申告期限から三年以内（当該期間が経過するまでの間に当該財産が分割されなかつたことにつき、当該相続又は遺贈に関し訴えの提起がされたことその他の政令で定めるやむを得ない事情がある場合において、政令で定めるところにより納税地の所轄税務署長の承認を受けたときは、当該財産の分割ができることとなつた日として政令で定める日の翌日から四月以内）に分割された場合には、その分割された財産については、この限りでない。」;
  分割されていない財産を申告期限から三年以内 (months <= 3) に分割する場合の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 2 = true (threshold_below), 3 = true (threshold_at, INCLUSIVE), 4 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `months <= 3` from statutory literals only
  (single literal 3, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax37_2PriorPeriodWithin4Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（指定対象期間の初日前四年以内 (years <= 4) の遡及期間 (特定期間) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2553 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（既に指定の取消しを受けた場合の除外・前各号の基準適合・第五項の取消し・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 37_2, paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:37_2/Article#37_2/Paragraph#2/Item#5/ItemSentence/Sentence#1`.

- Normative unit `NORM|f8dd551f9904c79c8b754c91ddfca9df1101eaf6abfeb6852bfeaa4f72196fac` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「都道府県等が指定対象期間の初日前四年以内（当該都道府県等が指定を受けていた期間に限る。次号において「特定期間」という。）において前各号に掲げる基準のうち適合すべきこととされていたものに適合していなかつた事実がないこと（当該事実により既に第五項の規定による指定の取消し（以下この条において「指定の取消し」という。）を受けた場合を除く。）。」;
  指定対象期間の初日前四年以内 (years <= 4) の遡及期間 (特定期間) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 3 = true (threshold_below), 4 = true (threshold_at, INCLUSIVE), 5 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 4` from statutory literals only
  (single literal 4, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax321_8TwoOrMoreShareholders.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（当該他の法人に株主等が二以上 (shareholders >= 2) ある場合の INCLUSIVE 下限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2553 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（発行済株式・出資の総数・自己の株式の控除・控除未済還付法人税額の計算・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 321_8, paragraph 24 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:321_8/Article#321_8/Paragraph#24/Item#1/ItemSentence/Column#2/Sentence#1`.

- Normative unit `NORM|4d40303ff657ac98fdfe72ff76773d15a2f6d921c428e0bcec5a5331f60a171e` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「当該前十年内事業年度に係る控除未済還付法人税額（当該他の法人に株主等が二以上ある場合には、当該控除未済還付法人税額を当該他の法人の発行済株式又は出資（当該他の法人が有する自己の株式又は出資を除く。）の総数又は総額で除し、これに当該法人の有する当該他の法人の株式又は出資の数又は金額を乗じて計算した金額）は、それぞれ当該控除未済還付法人税額に係る前十年内事業年度開始の日の属する当該法人の事業年度（当該法人の合併等事業年度開始の日以後に開始した当該被合併法人等の前十年内事業年度に係」;
  当該他の法人に株主等が二以上 (shareholders >= 2) ある場合の INCLUSIVE 下限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), 1 = false (small_input / threshold_below), 2 = true (threshold_at, INCLUSIVE), 3 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `shareholders >= 2` from statutory literals only
  (single literal 2, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax69AccompliceUpTo2Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（情を知つて前二項の行為の相手方となつた場合の二年以下の拘禁刑 (years <= 2) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2553 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（百五十万円以下の罰金・併科・前二項の行為の認定・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 69, paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:69/Article#69/Paragraph#3/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|713981f94fc0ba86398ae19c0b2db71fb733699f325cdf3527971f3e17db756c` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「情を知つて前二項の行為につき納税者又はその財産を占有する第三者の相手方となつたときは、その相手方としてその違反行為をした者は、二年以下の拘禁刑若しくは百五十万円以下の罰金に処し、又はこれを併科する。」;
  情を知つて前二項の行為の相手方となつた場合の二年以下の拘禁刑 (years <= 2) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input / threshold_below), 2 = true (threshold_at, INCLUSIVE), 3 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 2` from statutory literals only
  (single literal 2, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax192MiningTaxEvasionUpTo5Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（鉱区税の全部又は一部を免れた場合の五年以下の拘禁刑 (years <= 5) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2553 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（百万円以下の罰金・併科・偽りその他不正の行為の認定・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 192, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:192/Article#192/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|42c7c5896c22f9a5caa5a517bee417c03b879f60c76eb47f5911ed360cb8c63c` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「偽りその他不正の行為により鉱区税の全部又は一部を免れたときは、その違反行為をした者は、五年以下の拘禁刑若しくは百万円以下の罰金に処し、又はこれを併科する。」;
  鉱区税の全部又は一部を免れた場合の五年以下の拘禁刑 (years <= 5) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 4 = true (threshold_below), 5 = true (threshold_at, INCLUSIVE), 6 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 5` from statutory literals only
  (single literal 5, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2550 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2553 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 805/805 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
- `MANDATORY_PREVALIDATION_ALL_OK True` — every id pre-validated before finalisation.
