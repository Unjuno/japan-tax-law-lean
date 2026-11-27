# Adversarial review — batch 291

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 地方税法 snapshot (all five
surviving units are from law 325AC0000000226; 相続税法 candidates were rejected
because their only kanji numeral was a section/item reference rather than a
threshold, i.e. a numeral-only match).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item / column where applicable) of the named
`source_path` — never accepted as a number found merely somewhere in the whole
law text. The queue records were filtered with ONE mmap pass over
`build/task_queue.json` (candidates cached under gitignored
`build/batch291_candidates.json`): law id in {325AC0000000073,
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

### LocalTax455FineCeiling1M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四百五十五条 (Num 455), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:455/Article#455/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|76a4a70a45aebcf35faa2ea01dd7bc68a20205f906e95d99590f69a8836dc212` (kind CONDITION).
- Needle 「偽りその他不正の行為により軽自動車税の全部又は一部を免れたときは、その違反行為をした者は、百万円以下の罰金に処する。」;
  百万円以下 is INCLUSIVE (`≤`), so 1000000 is inside and 1000001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 999999 = true`, `inScopeBool 1000000 = true (limit, inclusive)`, `inScopeBool 1000001 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 1000000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四百五十五条(1)の軽自動車税の全部又は一部を免れた場合の罰金百万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2298 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（拘禁刑一年以下・不正行為の認定・情状判断・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax74_15EvadedAbove1M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十四条の十五 (Num 74_15), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:74_15/Article#74_15/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|bd6c5f51c32ffb0764482cc4bd192a2885e35fe43205d8f53059032607cf568b` (kind EXCEPTION).
- Needle 「第一項の免れた税額又は前項の還付を受けた金額が百万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、百万円を超える額でその免れた税額又は還付を受けた金額に相当する額以下の額とすることができる。」;
  百万円を超える is STRICT (`<`, threshold excluded), so 1000000 itself is outside and 1000001 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 999999 = false`, `inScopeBool 1000000 = false (limit, STRICT-excluded)`, `inScopeBool 1000001 = true` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `1000000 < evaded` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十四条の十五(3)の免れた税額が百万円を超える場合に罰金の額を引き上げることができるという下限（厳格））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2298 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（情状判断・相当額の算定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax703_5AdultEqualCharge18.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百三条の五 (Num 703_5), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:703_5/Article#703_5/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|d18a9f16ef71281efffb4230ea9baaed990c7664df566013465e9bd98ef9b975` (kind DELEGATION).
- Needle 「市町村は、国民健康保険税の納税義務者又はその世帯に属する被保険者が出産する予定の場合又は出産した場合には、政令で定める基準に従い当該市町村の条例で定めるところにより、当該納税義務者に対して課する所得割額、被保険者均等割額及び十八歳以上被保険者均等割額を減額するものとする。」;
  十八歳以上 is INCLUSIVE (`≥`), so 18 is inside and 17 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 17 = false`, `inScopeBool 18 = true (limit, inclusive)`, `inScopeBool 19 = true` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `18 ≤ age` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七百三条の五(3)の十八歳以上被保険者均等割額の減額対象年齢の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2298 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（政令基準・条例の内容・出産該当性・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax400RegisterWithin10Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四百条 (Num 400), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:400/Article#400/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|f81380149fb307f5c05ced827263f0113d8dd6ac7738d2178709c980ac5b8a68` (kind REFERENCE).
- Needle 「市町村長は、前条の規定による通知を受けた場合においては、その通知を受けた日から十日以内に道府県知事又は総務大臣の決定に係る当該価格等を固定資産課税台帳に登録しなければならない。」;
  十日以内 is INCLUSIVE (`≤`), so 10 is inside and 11 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 9 = true`, `inScopeBool 10 = true (limit, inclusive)`, `inScopeBool 11 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 10` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四百条(1)の通知を受けた日から十日以内に価格等を固定資産課税台帳に登録する上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2298 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（通知受領の認定・決定価格の内容・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax371DemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百七十一条 (Num 371), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:371/Article#371/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|15061fb2b2fa87d2cce2413975f5e349197451a55c9e06c68c850e5750002035` (kind CONDITION).
- Needle 「納税者が納期限までに固定資産税に係る地方団体の徴収金を完納しない場合においては、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 19 = true`, `inScopeBool 20 = true (limit, inclusive)`, `inScopeBool 21 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三百七十一条(1)の納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2298 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2295 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2298 jobs, exit 0).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 720/720 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
