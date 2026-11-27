# Adversarial review — batch 287

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 地方税法 snapshot (all five
units are from law 325AC0000000226; no 相続税法 candidate survived the mandatory
verbatim article + paragraph check). No human legal approval is recorded here;
every unit remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item / column where applicable) of the named
`source_path` — never accepted as a number found merely somewhere in the whole
law text. The queue records were filtered with ONE mmap pass over
`build/task_queue.json` (candidates cached under gitignored
`build/batch287_candidates.json`): law id in {325AC0000000073,
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

### LocalTax72_80_2TwoTrusteesDeeming.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の八十の二 (Num 72_80_2), paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_80_2/Article#72_80_2/Paragraph#4/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|623be03e65395857521c853b231781deacf59ce54a323174c1c4b91b2f283c53` (kind DEEMING).
- Needle 「一の法人課税信託等の受託者が二以上ある場合には、各受託者の当該法人課税信託等に係る信託資産等は、当該法人課税信託等の信託事務を主宰する受託者（次項において「主宰受託者」という。）の信託資産等とみなして、この節の規定を適用する。」;
  二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ trustees` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の八十の二(4)の一の法人課税信託等の受託者が二以上ある場合に各受託者の信託資産等を主宰受託者のものとみなすという下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2268 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（主宰受託者の指定・帰属内容・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax72_40DecisionWithinThreeMonths.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の四十 (Num 72_40), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_40/Article#72_40/Paragraph#1/ParagraphSentence/Sentence#2`.
- Normative unit `NORM|3ba81a308c698e5d332b0cac0ef9aea24c86821f3de8da7c2767144001c41b7e` (kind CONDITION).
- Needle 「この場合において、正当な事由がなくて当該税務官署が当該更正又は決定の請求を受けた日から三月以内に更正又は決定をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正又は決定をすべき旨を請求することができる。」;
  三月以内 is INCLUSIVE (`≤`), so 3 is inside and 4 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 2 = true`, `inScopeBool 3 = true (limit, inclusive)`, `inScopeBool 4 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `months ≤ 3` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の四十(1)の税務官署が更正又は決定の請求を受けた日から三月以内に更正又は決定をしない場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2268 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（正当事由の有無・請求手続・更正決定の内容・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax73_30EvadedTaxAboveOneMillion.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の三十 (Num 73_30), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_30/Article#73_30/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|30beacd51ed0f2c20f27f0bfe58d07315d276c86c35223aa2e5d8e162169ccc4` (kind EXCEPTION).
- Needle 「前項の免れた税額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその免れた税額に相当する額以下の額とすることができる。」;
  百万円を超える is STRICT (`<`, threshold excluded), so 1000000 itself is outside and 1000001 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 999999 = false`, `inScopeBool 1000000 = false (limit, STRICT-excluded)`, `inScopeBool 1000001 = true` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `1000000 < evaded` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十三条の三十(2)の免れた税額が百万円を超える場合に罰金の額を引き上げることができるという下限（从严））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2268 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（情状判断・相当額の算定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax703_4EighteenPlusInsuredAmount.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百三条の四 (Num 703_4), paragraph 29, item 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:703_4/Article#703_4/Paragraph#29/Item#1/ItemSentence/Sentence#1`.
- Normative unit `NORM|3252d278f5933e18696df8a3637e7449910fb3b052339d04ae13dafdeddf5ca4` (kind CONDITION).
- Needle 「所得割総額、資産割総額、被保険者均等割総額、十八歳以上被保険者均等割総額及び世帯別平等割総額の合計額」;
  十八歳以上 is INCLUSIVE (`≥`), so 18 is inside and 17 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph + item of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 17 = false`, `inScopeBool 18 = true (limit, inclusive)`, `inScopeBool 19 = true` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `18 ≤ age` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七百三条の四(29)1の十八歳以上被保険者均等割総額を合算対象とするという下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2268 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（各割の算定・合計額・他号他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax72_66DemandNoticeWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の六十六 (Num 72_66), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_66/Article#72_66/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|08797f1dc55dcad9efa1c8fbc50505c9009e4d6cb4715d269dc7dfc4af313117` (kind CONDITION).
- Needle 「納税者が納期限（法人の行う事業に対する事業税について更正又は決定があつた場合においては、不足税額の納期限をいう。以下法人の行う事業に対する事業税について同じ。）までに事業税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 19 = true`, `inScopeBool 20 = true (limit, inclusive)`, `inScopeBool 21 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の六十六(1)の納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2268 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2265 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2268 jobs, exit 0).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 710/710 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
