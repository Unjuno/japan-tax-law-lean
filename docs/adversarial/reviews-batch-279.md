# Adversarial review — batch 279

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
`build/batch279_candidates.json`): law id in {325AC0000000073,
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
clause rate. All boundary examples are kernel-decided (`by unfold …; decide`,
plus `inScopeBool N = bool := by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax1_3DoneeNoResidenceWithin10Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第一条の三 (Num 1_3), paragraph 2, item 2 (本則),
  `LawBody[3]/MainProvision/MainProvision[0]/Article:1_3/Article#1_3/Paragraph#2/Item#2/ItemSentence/Sentence#2`.
- Normative unit `NORM|5fbf0a987f37c8b42e45b155464d3795ee7125ab71ef574eab08a5522b692fec` (kind EXCEPTION).
- Needle 「ただし、当該受贈者が同条第一項の規定の適用に係る贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがない場合は、この限りでない。」;
  贈与前十年以内 is INCLUSIVE (`≤`), so 10 is inside and 11 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph + item of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 9 = true`, `inScopeBool 10 = true (limit, inclusive)`, `inScopeBool 11 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `years ≤ 10` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第一条の三(2)2の受贈者が贈与前十年以内のいずれの時にも施行地に住所を有していない場合の例外（十年の遡及期間））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2208 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（無住所の事実認定自体・同条第一項の適用要件・他号・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax24_3BeneficiariesTwoOrMoreDelegation.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十四条の三 (Num 24_3), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:24_3/Article#24_3/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|eeaafdaad7c6e74cde2c9e409bfc0f1a05edd1187fb1d9b8863d46176abd774b` (kind DELEGATION).
- Needle 「受益者が二以上ある場合における第一項の規定の適用、前項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前二項の規定の適用に関し必要な事項は、政令で定める。」;
  二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 2 = true (limit, inclusive)`, `inScopeBool 3 = true` — zero, small_input, threshold_at, threshold_above (4 distinct categories, all kernel-decided).
- Independent spec states the bound as `2 ≤ beneficiaries` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二十四条の三(3)の受益者が二以上ある場合に政令で必要な事項を定めるという委任の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2208 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（給付を受ける者の該当性判定自体・政令の内容・前二項の適用・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax72_21SubsidiaryOver50Percent.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の二十一 (Num 72_21), paragraph 6, item 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_21/Article#72_21/Paragraph#6/Item#2/ItemSentence/Sentence#1`.
- Normative unit `NORM|9585c06b7331519b5cba1e368ae5033d97b6f08ec8aecf88ed25d7b1fc3883dd` (kind EXCEPTION).
- Needle 「当該内国法人の当該事業年度終了の時又は当該事業年度の前事業年度終了の時における特定子会社（当該内国法人が発行済株式又は出資（政令で定めるものを除く。）の総数又は総額の百分の五十を超える数の株式又は出資を直接又は間接に保有する他の法人をいう。）の株式又は出資で、それぞれの時において当該内国法人が保有するものの帳簿価額の合計額」;
  百分の五十を超える is STRICT (`<`, threshold excluded); 百分の五十 = 50/100 = 0.5, exactly the clause rate, so 50 itself is outside and 51 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph + item of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 49 = false`, `inScopeBool 50 = false (limit, STRICT-excluded)`, `inScopeBool 51 = true` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `50 < percent` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の二十一(6)2の特定子会社を発行済株式又は出資の百分の五十を超える保有で定義する例外条件の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2208 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（特定子会社の他の定義要素・帳簿価額の算定・他の号・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax15_8CancellationWithin3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第十五条の八 (Num 15_8), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:15_8/Article#15_8/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|e0a09b22e994141abdfedb2964daf7d414f0eff908d3d313666f7e56459665cd` (kind REFERENCE).
- Needle 「地方団体の長は、前条第一項各号の規定により滞納処分の執行を停止した後三年以内に、その停止に係る滞納者につき同項各号に該当する事実がないと認めるときは、その執行の停止を取り消さなければならない。」;
  三年以内 is INCLUSIVE (`≤`), so 3 is inside and 4 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 2 = true`, `inScopeBool 3 = true (limit, inclusive)`, `inScopeBool 4 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `years ≤ 3` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第十五条の八の滞納処分の執行停止後三年以内に同項各号の事実がないと認めるときは取り消さなければならないという参照上の期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2208 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（執行停止自体・該当事実がないことの認定・取消しの実体的要件・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax292SpouseIncomeUpTo10M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二百九十二条 (Num 292), paragraph 1, item 8 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:292/Article#292/Paragraph#1/Item#8/ItemSentence/Column#2/Sentence#1`.
- Normative unit `NORM|f584d6cc9b9067eaccf6847632e27f079a502c11047f7f90f1e8a1ff2686b9ec` (kind CONDITION).
- Needle 「同一生計配偶者のうち、前年の合計所得金額が千万円以下である市町村民税の納税義務者の配偶者をいう。」;
  千万円以下 is INCLUSIVE (`≤`), so 10000000 is inside and 10000001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph + item of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 9999999 = true`, `inScopeBool 10000000 = true (limit, inclusive)`, `inScopeBool 10000001 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `yen ≤ 10000000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二百九十二条(1)8の同一生計配偶者を前年の合計所得金額千万円以下とする参照上の所得上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2208 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同一生計の事実認定自体・納税義務者の範囲・他の号・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2205 unique imports; `lake build` completed
  successfully (2208 jobs).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 690/690 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
