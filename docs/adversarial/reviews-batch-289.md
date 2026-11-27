# Adversarial review — batch 289

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 地方税法 snapshot (all five
surviving units are from law 325AC0000000226; 相続税法 candidates were rejected
because they either failed the mandatory verbatim article + paragraph check or
their only kanji numeral was a section/item reference rather than a threshold).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item / column where applicable) of the named
`source_path` — never accepted as a number found merely somewhere in the whole
law text. The queue records were filtered with ONE mmap pass over
`build/task_queue.json` (candidates cached under gitignored
`build/batch289_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path, short
scoped text, a threshold marker (以上 / 以下 / 超え / 以内) and exactly one
kanji numeral >= 2 (never statutory literal 1, never a 百分/千分 rate clause).
Existing `JapanTaxLaw/*.lean`, the transcription checks,
`data/TRANSCRIPTION_CHECK_REGISTRY.json` and the durable transcription pins
were searched first; none of these five units was previously modelled. Each
candidate was then pre-validated by importing
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

### LocalTax314_2IncomeCeiling25M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百十四条の二 (Num 314_2), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:314_2/Article#314_2/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|7e278c2b32667e9eceb1e211ae9d12770874aeddc226d0cb7ea1f36244d6c0cf` (kind CONDITION).
- Needle 「市町村は、前年の合計所得金額が二千五百万円以下である所得割の納税義務者については、その者の前年の所得について算定した総所得金額、退職所得金額又は山林所得金額から、次の各号に掲げる場合の区分に応じ、当該各号に定める金額を控除するものとする。」;
  二千五百万円以下 is INCLUSIVE (`≤`), so 25000000 is inside and 25000001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 24999999 = true`, `inScopeBool 25000000 = true (limit, inclusive)`, `inScopeBool 25000001 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `income ≤ 25000000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三百十四条の二(2)の前年の合計所得金額が二千五百万円以下である所得割の納税義務者への控除の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2283 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（控除額の算定・所得の区分・他号他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax718_2TwoAnnuityBenefits.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百十八条の二 (Num 718_2), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:718_2/Article#718_2/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|6432ca17b796e65625ade767be7585f3fa431d4b18198c6b72e43adf78ec96fb` (kind DELEGATION).
- Needle 「市町村は、同一の特別徴収対象被保険者について老齢等年金給付が二以上ある場合においては、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について国民健康保険税を徴収させるものとする。」;
  二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ benefits` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七百十八条の二(2)の老齢等年金給付が二以上ある場合に一の給付について国民健康保険税を徴収させるという下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2283 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（政令の内容・特別徴収手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax328_16EvadedAboveTwoMillion.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百二十八条の十六 (Num 328_16), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:328_16/Article#328_16/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|b89a2d17b5638e7628b2c14eabad94e59f846577953db192e03e614a48d7b06f` (kind EXCEPTION).
- Needle 「第一項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」;
  二百万円を超える is STRICT (`<`, threshold excluded), so 2000000 itself is outside and 2000001 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 1999999 = false`, `inScopeBool 2000000 = false (limit, STRICT-excluded)`, `inScopeBool 2000001 = true` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `2000000 < evaded` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三百二十八条の十六(3)の納入しなかつた金額が二百万円を超える場合に罰金の額を引き上げることができるという下限（从严））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2283 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（情状判断・相当額の算定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax198DemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百九十八条 (Num 198), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:198/Article#198/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|4ca54f7f5d3058926bfc01e963fa0842bda6f545d9e959acd7f38f4caf1661f2` (kind CONDITION).
- Needle 「納税者が納期限までに鉱区税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 19 = true`, `inScopeBool 20 = true (limit, inclusive)`, `inScopeBool 21 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第百九十八条(1)の納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2283 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax72_2CapitalCeiling100M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の二 (Num 72_2), paragraph 2, item 1, column 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_2/Article#72_2/Paragraph#2/Item#1/ItemSentence/Column#1/Sentence#1`.
- Normative unit `NORM|11fc94ad2175496397b2419fa27d5e0eed267f716689326d1fd6b67cffdda0e2` (kind EXCEPTION).
- Needle 「資本金の額又は出資金の額が一億円以下の法人であるかどうか及び資本又は出資を有しない法人であるかどうかの判定並びに前項第一号ロ（１）又は（２）に掲げる法人に該当するものであるかどうかの判定に関し必要な事項の判定（次号に掲げる判定を除く。）」;
  一億円以下 is INCLUSIVE (`≤`), so 100000000 is inside and 100000001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph + item, column 1 of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 99999999 = true`, `inScopeBool 100000000 = true (limit, inclusive)`, `inScopeBool 100000001 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `capital ≤ 100000000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の二(2)1の資本金の額又は出資金の額が一億円以下の法人であるかどうかの判定の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2283 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（無資本法人の判定・前項第一号ロの判定・他号他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2280 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2283 jobs, exit 0).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 715/715 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
