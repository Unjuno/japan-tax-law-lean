# Adversarial review — batch 281

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 相続税法 / 地方税法 snapshots.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item where applicable) of the named
`source_path` — never accepted as a number found merely somewhere in the whole
law text. The queue records were filtered with ONE mmap pass over
`build/task_queue.json` (candidates cached under gitignored
`build/batch281_candidates.json`): law id in {325AC0000000073,
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

### InheritanceTax10DebtorsTwoOrMoreDelegation.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第十条 (Num 10), paragraph 1, item 7 (本則),
  `LawBody[3]/MainProvision/MainProvision[0]/Article:10/Article#10/Paragraph#1/Item#7/ItemSentence/Sentence#1`.
- Normative unit `NORM|9a128f02927adc92c51413534f9ae96a2edbdcc05ec84c5156d3e6f52d732a11` (kind DELEGATION).
- Needle 「貸付金債権については、その債務者（債務者が二以上ある場合においては、主たる債務者とし、主たる債務者がないときは政令で定める一の債務者）の住所又は本店若しくは主たる事務所の所在」;
  債務者が二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph + item of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ debtors` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第十条(1)7の貸付金債権の債務者が二以上ある場合に主たる債務者とするという委任上の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2223 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（主たる債務者の特定自体・政令で定める一の債務者・住所の所在・他号他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax72_38_2ExtensionWithin3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の三十八の二 (Num 72_38_2), paragraph 5 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_38_2/Article#72_38_2/Paragraph#5/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|60c47ab3118e23043948ca7161b7df5a09ed6f37823d291f5ccf6f48ea561859` (kind CONDITION).
- Needle 「道府県知事は、第一項の規定により徴収を猶予した場合において、その猶予をした期間内にその猶予をした金額を納付することができないやむを得ない理由があると認めるときは、当該法人の申請により、三年以内の期間を限りその期間を延長することができる。」;
  三年以内 is INCLUSIVE (`≤`), so 3 is inside and 4 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 2 = true`, `inScopeBool 3 = true (limit, inclusive)`, `inScopeBool 4 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `years ≤ 3` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の三十八の二(5)のやむを得ない理由がある場合に三年以内の期間を限り徴収猶予を延長できるという参照上の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2223 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（徴収猶予自体・やむを得ない理由の認定・申請の要件・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax72_113PaymentWithin30Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の百十三 (Num 72_113), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_113/Article#72_113/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|874d63a92690f3f0e32ed5baab90873c7bc3da8bb7a1780d4af3be8272c918c6` (kind REFERENCE).
- Needle 「道府県知事は、前項の規定による通知があつた場合においては、その通知があつた日から三十日以内に、第一項の徴収取扱費を支払うものとする。」;
  三十日以内 is INCLUSIVE (`≤`), so 30 is inside and 31 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 29 = true`, `inScopeBool 30 = true (limit, inclusive)`, `inScopeBool 31 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 30` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の百十三(3)の通知があつた日から三十日以内に第一項の徴収取扱費を支払うという参照上の期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2223 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（通知自体・徴収取扱費の額の算定・支払方法・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax23DependentsTwoOrMoreDeeming.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十三条 (Num 23), paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:23/Article#23/Paragraph#4/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|7bb701bcd3ae15ce4309a3286ba0046aa86731796f76d1573f0174550808c297` (kind DEEMING).
- Needle 「二以上の道府県民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」;
  二以上の道府県民税の納税義務者 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ taxpayers` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二十三条(4)の二以上の納税義務者の扶養親族等に該当する者をいずれか一の納税義務者の扶養親族等とみなす下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2223 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（該当性の事実認定・帰属先の具体的指定・政令の内容・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax144_16CertificateReturnWithin10Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百四十四条の十六 (Num 144_16), paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:144_16/Article#144_16/Paragraph#4/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|e1b051afe2b3a8b76eabc0b473440482e00af8fc5e5a1461bcb9db62de001ca0` (kind CONDITION).
- Needle 「第一項の証票の交付を受けた者は、軽油引取税の特別徴収の義務が消滅した場合又は事務所若しくは事業所を廃止した場合には、その消滅し、又は廃止した日から十日以内にその証票を道府県知事に返さなければならない。」;
  十日以内 is INCLUSIVE (`≤`), so 10 is inside and 11 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 9 = true`, `inScopeBool 10 = true (limit, inclusive)`, `inScopeBool 11 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 10` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第百四十四条の十六(4)の特別徴収義務の消滅又は廃止の日から十日以内に証票を返さなければならないという期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2223 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（義務消滅自体・廃止の認定・証票交付・返還手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2220 unique imports; `lake build` completed
  successfully (2223 jobs).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 695/695 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
