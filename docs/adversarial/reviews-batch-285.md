# Adversarial review — batch 285

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
`build/batch285_candidates.json`): law id in {325AC0000000073,
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

### LocalTax17_4TwoOrMoreInstallmentsDeeming.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第十七条の四 (Num 17_4), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:17_4/Article#17_4/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|e34e5660b79b7f285b0aff66f4d8de64588182d5cf7f637826c689ab47f2399d` (kind DEEMING).
- Needle 「二以上の納期又は二回以上の分割納付若しくは分割納入に係る地方団体の徴収金につき過誤納を生じた場合には、その過誤納金については、その過誤納金の額に相当する地方団体の徴収金に達するまで、納付又は納入の日の順序に従い最後に納付又は納入された金額から順次遡つて求めた金額からなるものとみなして、第一項の規定を適用する。」;
  二以上の納期 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ installments` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第十七条の四(3)の二以上の納期又は二回以上の分割納付若しくは分割納入に係る徴収金に過誤納を生じた場合にその過誤納金をみなして第一項を適用するという下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2253 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（充当順序・額算定・第一項の適用自体・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax73_24TwoYearNewHouseCondition.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の二十四 (Num 73_24), paragraph 1, item 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_24/Article#73_24/Paragraph#1/Item#1/ItemSentence/Sentence#1`.
- Normative unit `NORM|55d86580d3dde2818fb2e8e4484a472d2aa026699601cf64f7b4a99dcc0d8155` (kind CONDITION).
- Needle 「土地を取得した日から二年以内に当該土地の上に特例適用住宅が新築された場合（当該取得をした者（以下この号において「取得者」という。）が当該土地を当該特例適用住宅の新築の時まで引き続き所有している場合又は当該特例適用住宅の新築が当該取得者から当該土地を取得した者により行われる場合に限る。）」;
  二年以内 is INCLUSIVE (`≤`), so 2 is inside and 3 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph + item of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = false` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `years ≤ 2` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十三条の二十四(1)1の土地取得日から二年以内に特例適用住宅が新築された場合に限るという参照上の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2253 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（所有継続・新築主体の認定・特例適用住宅の定義・他号他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax144_30NotificationWithin60Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百四十四条の三十 (Num 144_30), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:144_30/Article#144_30/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|8800ded7feb6277f86fa62028979eaa852a5d791aee2513027bce600064f8257` (kind REFERENCE).
- Needle 「道府県知事は、第一項の規定による申請を受理した場合においては、同項又は前項に規定する措置を採るかどうかについて、その申請を受理した日から六十日以内に特別徴収義務者に通知しなければならない。」;
  六十日以内 is INCLUSIVE (`≤`), so 60 is inside and 61 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 59 = true`, `inScopeBool 60 = true (limit, inclusive)`, `inScopeBool 61 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 60` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第百四十四条の三十(3)の申請受理日から六十日以内に特別徴収義務者に通知しなければならないという期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2253 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（受理自体・措置採否の判断・通知手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax292TwoResidentTaxpayersDeeming.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二百九十二条 (Num 292), paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:292/Article#292/Paragraph#4/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|59821b98b5572f5a765a66428e88cd443f71b6560e44ab65ae53946b77ee0b2e` (kind DEEMING).
- Needle 「二以上の市町村民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」;
  二以上の市町村民税の納税義務者 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ taxpayers` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二百九十二条(4)の二以上の市町村民税の納税義務者の扶養親族又は特定親族に該当する者がいる場合の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2253 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（政令の内容・該当性の認定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax433DecisionWithin30Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四百三十三条 (Num 433), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:433/Article#433/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|d3f870931f2f605a6e613869e42984168124662362f147dfa3321802d01763b5` (kind REFERENCE).
- Needle 「固定資産評価審査委員会は、前条第一項の審査の申出を受けた場合においては、直ちにその必要と認める調査その他事実審査を行い、その申出を受けた日から三十日以内に審査の決定をしなければならない。」;
  三十日以内 is INCLUSIVE (`≤`), so 30 is inside and 31 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 29 = true`, `inScopeBool 30 = true (limit, inclusive)`, `inScopeBool 31 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 30` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四百三十三条(1)の審査の申出を受けた日から三十日以内に審査の決定をしなければならないという期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2253 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（調査の内容・決定の内容・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2250 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2253 jobs, exit 0).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 705/705 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
