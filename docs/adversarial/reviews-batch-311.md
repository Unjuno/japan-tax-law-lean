# Adversarial review — batch 311

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
under gitignored `build/batch311_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path traversing
MainProvision only (no 附則), short scoped text (<300 chars), and a threshold
marker (以上 / 以下 / 超え / 以内 / をこえる). The single mmap pass yielded 384
candidates; 132 carried a kanji numeral >= 2 attached to a threshold marker.
Seventeen shortlisted candidates were pre-validated: four
(相続税法 art. 21_9 「十八歳以上」, 地方税法 art. 34 「三万二千円以下」, 地方税法
art. 154 「二トン以下」, 地方税法 art. 314_2 「十年以上」) FAILED the mandatory
checks (numeral-on-threshold anchoring or verbatim article + paragraph pin) and
were REPLACED; eight further passing candidates were passed over to keep the
final five diverse and non-duplicative. During the mmap filter and selection,
candidates with competing thresholds, section-reference-only 「以下」 markers,
rate clauses (百分のN) or fractional numerals were excluded. Existing
`JapanTaxLaw/*.lean`, the transcription checks, `data/TRANSCRIPTION_CHECK_REGISTRY.json`
and the durable transcription pins were searched first; none of these five units
was previously modelled (no verbatim needle and no same-article/same-phrase unit).
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
(11 here) covering >= 3 distinct boundary categories (5 here).
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」/「をこえる」 are STRICT. No
statutory literal 1 is used as a threshold value in any spec (single spec
literals: 3, 6, 20, 4, 100000000). The single-literal `百分のN` ceiling/floor is
used only where N/100 is exactly the clause rate (none of these five units
uses one). All boundary examples are kernel-decided (`by unfold …; decide`,
plus `inScopeBool N = bool := by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax47WithdrawalDecisionWithin3Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第四十七条 (Num 47), paragraph 3 (本則),
  `LawBody[3]/MainProvision/MainProvision[5]/Article:47/Article#47/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|9e0f7e9b813702184959bd2aacc46156a16f0d7e7c1e289735197b4883d7506c` (kind EXCEPTION).
- Needle 「税務署長は、前項の規定による申請書の提出があつた場合においては、その申請の基因となる物納の撤回の申請の却下をする場合を除き、当該申請者及び当該申請に係る事項について前条第一項及び前二項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出期限の翌日から起算して三月以内に当該申請に係る税額の全部又は一部について当該申請に係る条件若しくはこれを変更した条件により物納の撤回に係る延納の許可をし、又は当該申請の却下をする。」;
  三月以内 is INCLUSIVE (`≤`), so 3 is inside and 4 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 2 = true` (threshold_below), `inScopeBool 3 = true` (threshold_at (inclusive)), `inScopeBool 4 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `days ≤ 3` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四十七条(3)の物納撤回申請について三月以内に延納許可又は却下をする場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2448 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（却下例外・該当性調査・条件変更・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### InheritanceTax42SnowSurveyOver6Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第四十二条 (Num 42), paragraph 17 (本則),
  `LawBody[3]/MainProvision/MainProvision[5]/Article:42/Article#42/Paragraph#17/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|721c4e58fb684025cc0465e3fba349bb869a1d6ad1a369aed6fc13bd4159f9e2` (kind CONDITION).
- Needle 「第二項の規定により、税務署長が、同項の調査を行う場合において、積雪その他これに準ずる事由により当該調査に六月を超える期間を要すると認めるときにおける前項の規定の適用については、同項中「六月」とあるのは、「九月」とする。」;
  六月を超える is STRICT (`>`), so 6 itself is outside and 7 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 5 = false` (threshold_below), `inScopeBool 6 = false` (threshold_at (STRICT: excluded)), `inScopeBool 7 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at (STRICT: excluded), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `6 < months` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四十二条(17)の積雪等による調査に六月を超える期間を要する場合の厳密下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2448 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第二項の調査手続・「九月」への書換え・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax22_29ProsecutionWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十二条の二十九 (Num 22_29), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:22_29/Article#22_29/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|a0d29eaffc5136b71dc88e39d943e51acdb5e27e3aba46f3a944e74c77185070` (kind REFERENCE).
- Needle 「地方団体の長は、犯則者が前条第一項の通告（同条第三項の規定による更正があつた場合には、当該更正。以下この条において「通告等」という。）を受けた場合において、当該通告等を受けた日の翌日から起算して二十日以内に当該通告の旨を履行しないときは、検察官に告発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二十二条の二十九(1)の通告等から二十日以内に履行しない場合の告発期限の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2448 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（通告・更正・通告等の定義・告発の効果・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax154PassengerCapacityAtLeast4.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百五十四条 (Num 154), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:154/Article#154/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|94cf2cf2fe0288eb9b56efc4e21208d962ec20edf37d78ebd815e4dfc0878469` (kind EXCEPTION).
- Needle 「前項第二号に掲げる自動車のうち最大乗車定員が四人以上であるものに対して課する自動車税の標準税率は、同項（同号に係る部分に限る。）の規定にかかわらず、同号に定める額に、次の各号の区分に応じ当該各号に定める額を、それぞれ加算した額とする。」;
  四人以上 is INCLUSIVE (`≥`), so 4 is inside and 3 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 3 = false` (threshold_below), `inScopeBool 4 = true` (threshold_at (inclusive)), `inScopeBool 5 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `4 ≤ passengers` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第百五十四条(2)の最大乗車定員が四人以上である自動車の標準税率加算の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2448 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前項第二号の区分・加算額・他の定員区分・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax53CapitalOver100M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第五十三条 (Num 53), paragraph 66, item 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:53/Article#53/Paragraph#66/Item#1/ItemSentence/Sentence#1`.
- Normative unit `NORM|0ede6682bb3d0d5af128a9ee5d4a5dc1e271e59892cc37d3b574788afe685d8b` (kind CONDITION).
- Needle 「納税申告書に係る事業年度開始の日（公共法人等にあつては、前年四月一日）現在における資本金の額又は出資金の額が一億円を超える法人」;
  一億円を超える is STRICT (`>`), so 100000000 itself is outside and 100000001 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 99999999 = false` (threshold_below), `inScopeBool 100000000 = false` (threshold_at (STRICT: excluded)), `inScopeBool 100000001 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at (STRICT: excluded), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `100000000 < yen` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第五十三条(66)の資本金又は出資金の額が一億円を超える法人の厳密下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2448 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（事業年度開始の日・公共法人等特例・法人税割計算・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2445 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2448 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 770/770 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
