# Adversarial review — batch 295

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 地方税法 snapshot (all five
surviving units are from law 325AC0000000226; 相続税法 candidates were rejected
because their only kanji numeral was a section/item reference, a fractional
notation or a statutory literal 1, i.e. a numeral-only match).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (candidates cached under
gitignored `build/batch295_candidates.json`): law id in {325AC0000000073,
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
numeral-only match or UNRESOLVED unit was accepted. 「以上」/「以下」/「以内」 are
INCLUSIVE; 「を超え」/「をこえる」 are STRICT. No statutory literal 1 is used as a
threshold value in any spec. The single-literal `百分のN` ceiling/floor is used
only where N/100 is exactly the clause rate (none of these five units uses
one). All boundary examples are kernel-decided (`by unfold …; decide`, plus
`inScopeBool N = bool := by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax27PenaltyFineCeiling500k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十七条 (Num 27), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:27/Article#27/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|47870cf520e1aaea9319e84caef449b43cffea6b069d75479fc7b94140a5edd1` (kind CONDITION).
- Needle 「次の各号のいずれかに該当する場合には、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」;
  五十万円以下 is INCLUSIVE (`≤`), so 500000 is inside and 500001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 499999 = true` (threshold_below), `inScopeBool 500000 = true` (threshold_at (inclusive)), `inScopeBool 500001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 500000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二十七条(1)の違反行為に対する罰金五十万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2328 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（一年以下の拘禁刑・各号の該当性・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax73_30EvadedAbove500k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の三十 (Num 73_30), paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_30/Article#73_30/Paragraph#4/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|49a2a78a51cd6eaf13450819bcc780ded6654854eaf27619966af2eb4491e994` (kind EXCEPTION).
- Needle 「前項の免れた税額が五十万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、五十万円を超える額でその免れた税額に相当する額以下の額とすることができる。」;
  五十万円を超える is STRICT (`<`, threshold excluded), so 500000 itself is outside and 500001 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 499999 = false` (threshold_below), `inScopeBool 500000 = false` (threshold_at (STRICT: excluded)), `inScopeBool 500001 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `500000 < evaded` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十三条の三十(4)の免れた税額が五十万円を超える場合に罰金の額を引き上げることができるという下限（厳格））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2328 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（情状判断・相当額の算定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax86UnpaidAbove1M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第八十六条 (Num 86), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:86/Article#86/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|168a9c5e9c65038b774c1c767681820184811830eddce67622de25b52220af5c` (kind EXCEPTION).
- Needle 「前項の納入しなかつた金額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」;
  百万円を超える is STRICT (`<`, threshold excluded), so 1000000 itself is outside and 1000001 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 999999 = false` (threshold_below), `inScopeBool 1000000 = false` (threshold_at (STRICT: excluded)), `inScopeBool 1000001 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `1000000 < unpaid` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第八十六条(2)の納入しなかつた金額が百万円を超える場合に罰金の額を引き上げることができるという下限（厳格））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2328 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（情状判断・相当額の算定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax522_2MiningFilingFineCeiling100k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第五百二十二条の二 (Num 522_2), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:522_2/Article#522_2/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|d5e8337731ae44b8a3209c1c44ca3c71baaed46047161938f212a87f4d2ba152` (kind REFERENCE).
- Needle 「市町村は、鉱産税の納税者が正当な事由がなくて前条の規定による申告書を同条に規定する申告書の提出期限までに提出しなかつた場合においては、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」;
  十万円以下 is INCLUSIVE (`≤`), so 100000 is inside and 100001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 99999 = true` (threshold_below), `inScopeBool 100000 = true` (threshold_at (inclusive)), `inScopeBool 100001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 100000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第五百二十二条の二(1)の鉱産税の申告書を期限までに提出しなかつた場合の過料十万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2328 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（正当な事由の認定・条例の内容・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax700_64HuntingDemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百条の六十四 (Num 700_64), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:700_64/Article#700_64/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|d3a32fadc0a9a7c617eabc5e9cff7fab844bf8799862c7bc455a6249e516193d` (kind CONDITION).
- Needle 「納税者が納期限までに狩猟税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七百条の六十四(1)の狩猟税について納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2328 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2325 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2328 jobs, exit 0).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 730/730 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
