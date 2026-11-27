# Adversarial review — batch 297

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 地方税法 snapshot (all five
surviving units are from law 325AC0000000226; 相続税法 candidates were rejected
because their only kanji numeral was a section/item reference, a 「一年を超えない」
effect-period phrase, a fractional notation or a statutory literal 1, i.e. a
numeral-only match, or because they were pinned in the 附則).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (candidates cached under
gitignored `build/batch297_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path, short
scoped text, a threshold marker (以上 / 以下 / 超え / 以内) and exactly one
kanji numeral >= 2 (never statutory literal 1, never a 百分/千分 rate clause).
The qualifying numeral was additionally required to sit directly on the
threshold marker, and the source path was required to traverse MainProvision
only; candidates pinned in the 附則 (SupplProvision) were REPLACED because the
scoped transcription audit walks MainProvision articles only.
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
SHA-256-pinned article + paragraph of the raw JSON (one scoped hit). No
numeral-only match or UNRESOLVED unit was accepted. Every 「以上」 candidate was
rejected as a numeral-only match (the numeral sat elsewhere in the clause, not
on 「以上」). 「以上」/「以下」/「以内」 are
INCLUSIVE; 「を超え」/「をこえる」 are STRICT. No statutory literal 1 is used as a
threshold value in any spec. The single-literal `百分のN` ceiling/floor is used
only where N/100 is exactly the clause rate (none of these five units uses
one). All boundary examples are kernel-decided (`by unfold …; decide`, plus
`inScopeBool N = bool := by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax72_102UndeclaredReturnFineCeiling500k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の百二 (Num 72_102), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_102/Article#72_102/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|fb0ce3bef1d5b7acfec8041d9cc879dc36773faa3c5065a00cf275642a39113f` (kind REFERENCE).
- Needle 「正当な理由がなくて前条の規定による申告書をその提出期限までに提出しなかつたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」;
  五十万円以下 is INCLUSIVE (`≤`), so 500000 is inside and 500001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 499999 = true` (threshold_below), `inScopeBool 500000 = true` (threshold_at (inclusive)), `inScopeBool 500001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 500000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の百二(1)の申告書未提出に対する罰金五十万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2343 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（一年以下の拘禁刑・前条の要件該当性・情状判断・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax281EvadedAbove1M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二百八十一条 (Num 281), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:281/Article#281/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|ccac1f3c6ee1023af0475c8b50320708b0966d3d062c435fc664084392e53e3f` (kind EXCEPTION).
- Needle 「第一項の免れた税額又は前項の納入しなかつた金額が百万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、百万円を超える額でその免れた税額又は納入しなかつた金額に相当する額以下の額とすることができる。」;
  百万円を超える is STRICT (`<`, threshold excluded), so 1000000 itself is outside and 1000001 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 999999 = false` (threshold_below), `inScopeBool 1000000 = false` (threshold_at (STRICT: excluded)), `inScopeBool 1000001 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `1000000 < evaded` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二百八十一条(3)の免れた税額又は納入しなかつた金額が百万円を超える場合に罰金の額を引き上げることができるという下限（厳格））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2343 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（情状判断・相当する額以下の上限・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax458LightVehicleDemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四百五十八条 (Num 458), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:458/Article#458/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|fb1eda70cad1d60754855910428afd28796008909ad18852f979510e80de12ed` (kind CONDITION).
- Needle 「納税者が納期限までに軽自動車税に係る地方団体の徴収金を完納しない場合には、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四百五十八条(1)の軽自動車税について納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2343 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax144_49LightOilDemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百四十四条の四十九 (Num 144_49), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:144_49/Article#144_49/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|6c828ca046a2a3c665bd07b7480cf1c8c6e49eeb1352c85a4817bbcc84151623` (kind CONDITION).
- Needle 「軽油引取税の特別徴収義務者又は納税者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下この節において同じ。）までに軽油引取税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第百四十四条の四十九(1)の軽油引取税について納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2343 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（更正決定の有無・完納認定・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax73_19FalseReportFineCeiling500k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の十九 (Num 73_19), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_19/Article#73_19/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|121bebce906a5a073e6f6ad1e0f8b2d277e695cb10c19df3291ace01af3ef052` (kind REFERENCE).
- Needle 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」;
  五十万円以下 is INCLUSIVE (`≤`), so 500000 is inside and 500001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 499999 = true` (threshold_below), `inScopeBool 500000 = true` (threshold_at (inclusive)), `inScopeBool 500001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 500000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十三条の十九(1)の虚偽の申告又は報告に対する罰金五十万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2343 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（一年以下の拘禁刑・前条の要件該当性・情状判断・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2340 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2343 jobs, exit 0).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 735/735 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
