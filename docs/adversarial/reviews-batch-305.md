# Adversarial review — batch 305

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshots: one from
相続税法 (law 325AC0000000073) and four from 地方税法 (law 325AC0000000226).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (candidates cached under
gitignored `build/batch305_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path traversing
MainProvision only (no 附則), short scoped text, a threshold marker
(以上 / 以下 / 超え / 以内 / をこえる) and exactly one distinct kanji numeral >= 2
(never a statutory literal 1 as the qualifying threshold, never a 百分/千分 rate
clause). The qualifying numeral was additionally required to sit directly on the
threshold marker, and no numeral-only/section-reference match was accepted.
Several further candidates were REPLACED during selection and pre-validation:
the five 地方税法 art. 34 insurance-premium deduction candidates whose needles
were not verbatim in the scoped article + paragraph of the raw JSON
(table/column pin mismatch); the art. 154 「一・五リットル」/「一トンを超え二トン以下」
candidates (fractional statute whose kanji digit is not the statutory literal,
two-threshold range, and a statutory literal 1); rate clauses such as
「百分の八・四」/「百分の一・二」 where N/100 is not exactly the clause rate; and
the art. 73の27の六 「五年以内」 candidate whose clause also contains 「一年」
(a second threshold and a statutory literal 1). Existing `JapanTaxLaw/*.lean`,
the transcription checks, `data/TRANSCRIPTION_CHECK_REGISTRY.json` and the
durable transcription pins were searched first; none of these five units was
previously modelled. Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` and `tq.build_tasks` for each law, and
confirming verifiable kind, empty `unhandled_conditions`, no UNRESOLVED unit,
`clause_correspondence` True with basis `spec numerals / rate ratio in clause`,
unit text inside `scoped_article_text(law, article, needles)`, coverage exact +
unique ids, a source path, and verbatim law/revision/needle presence in the
SHA-256-pinned article + paragraph of the raw JSON (one scoped hit). The
generated Spec.lean files were re-checked so that statutory literals live only
inside `def specInScope` before the first `theorem ` marker, with an
independent formula (no implementation identifier), a universal axiom-free
bridge, a Decidable Bool mirror, and >= 5 kernel-decided examples (>= 9 here)
covering >= 3 distinct boundary categories. 「以上」/「以下」/「以内」 are
INCLUSIVE; 「を超え」/「をこえる」/「を超える」 are STRICT. No statutory literal 1 is
used as a threshold value in any spec. The single-literal `百分のN`
ceiling/floor is used only where N/100 is exactly the clause rate (none of
these five units uses one). All boundary examples are kernel-decided
(`by unfold …; decide`, plus `inScopeBool N = bool := by decide`), not asserted
by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax46InKindRevocationTwoOrMore.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第四十六条 (Num 46), paragraph 4 (本則),
  `LawBody[3]/MainProvision/MainProvision[5]/Article:46/Article#46/Paragraph#4/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|23d5b399018f6fb54178cee3e076a28032e3b87796c6f0f079310846fe1ca92f` (kind DELEGATION).
- Needle 「税務署長は、前項の場合において、物納の許可があつた二以上の不動産の一部について物納の撤回の申請があり、又は物納の許可があつた一の不動産を分割してその一部について物納の撤回の申請があつたとき（これらの申請のあつた財産以外の物納財産のうちにその物納の撤回により管理又は処分をするのに不適格な財産として政令で定めるもの（以下この条において「不適格財産」という。）があるときに限る。）は、当該不適格財産を物納の撤回の申請に係る財産に追加することを求め、当該申請者が当該財産に当該不適格財産」;
  二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 2 = true` (threshold_at), `inScopeBool 3 = true` (threshold_above) — zero, small_input, threshold_at, threshold_above (4 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `2 ≤ properties` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四十六条(4)の物納の許可があつた不動産が二以上の場合の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2403 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（分割情形・不適格財産の認定・追加要求の効力・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax20_9_3RefundWithin5Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十条の九の三 (Num 20_9_3), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:20_9_3/Article#20_9_3/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|e593dd0d3a5235a22243845bd072a602820800fbed04b469c42279b480ea1f00` (kind CONDITION).
- Needle 「申告納付又は申告納入に係る地方税の申告書（以下この条において「申告書」という。）を提出した者は、当該申告書に記載した課税標準等若しくは税額等の計算が地方税に関する法令の規定に従つていなかつたこと又は当該計算に誤りがあつたことにより、次の各号のいずれかに該当する場合には、当該申告書に係る地方税の法定納期限から五年以内に限り、総務省令の定めるところにより、地方団体の長に対し、その申告に係る課税標準等又は税額等（当該課税標準等又は税額等に関し更正があつた場合には、当該更正後の課税標」;
  五年以内 is INCLUSIVE (`≤`), so 5 is inside and 6 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 4 = true` (threshold_below), `inScopeBool 5 = true` (threshold_at (inclusive)), `inScopeBool 6 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `years ≤ 5` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二十条の九の三(1)の地方税の申告書に係る更正の請求を五年以内にする場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2403 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（各号該当性・省令手続・更正後読替・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax72_33BusinessTaxCorrectionWithin2Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の三十三 (Num 72_33), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_33/Article#72_33/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|c53797dfc4fabdf5653a6ab2c48854a99899b009c52c48f84e5f63da01490fec` (kind EXCEPTION).
- Needle 「申告書又は修正申告書を提出した法人（収入割のみを申告納付すべきものを除く。）が、当該申告又は修正申告に係る事業税の計算の基礎となつた事業年度に係る法人税の課税標準について国の税務官署の更正又は決定を受けたことに伴い、当該申告又は修正申告に係る付加価値額、資本金等の額若しくは所得又は事業税額が過大となる場合には、国の税務官署が当該更正又は決定の通知をした日から二月以内に限り、総務省令で定めるところにより、道府県知事に対し、当該付加価値額、資本金等の額若しくは所得又は事業税額につ」;
  二月以内 is INCLUSIVE (`≤`), so 2 is inside and 3 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 2 = true` (threshold_at), `inScopeBool 3 = false` (threshold_above) — zero, small_input, threshold_at, threshold_above (4 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `months ≤ 2` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の三十三(2)の国の更正決定に伴う事業税額等の更正請求を二月以内にする場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2403 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（収入割除外・変更事由・省令手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax72_40TwoOrMorePrefectures.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の四十 (Num 72_40), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_40/Article#72_40/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|917d456d2a7da86c125ef4210c358fd8ee191cb2d7bd504784205e66cbf26c88` (kind REFERENCE).
- Needle 「二以上の道府県において事務所又は事業所を設けて事業を行う法人に係る法人税の課税標準について、前項の規定によつて税務官署に対しすべき更正又は決定の請求は、当該法人の主たる事務所又は事業所所在地の道府県知事（外国法人にあつては、この法律の施行地において行う事業の経営の責任者が主として執務する事務所又は事業所所在地の道府県知事）又は当該法人の主たる事務所又は事業所所在地の道府県知事を経由して関係道府県知事が行うものとする。」;
  二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 2 = true` (threshold_at), `inScopeBool 3 = true` (threshold_above) — zero, small_input, threshold_at, threshold_above (4 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `2 ≤ prefectures` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の四十(2)の二以上の道府県に事業所を設ける法人の更正請求の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2403 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（外国法人読替・主たる事務所指定・関係知事判断・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax726IrrigationTaxDemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百二十六条 (Num 726), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:726/Article#726/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|91bd51d8c0f0d5bb75ff53da20b4144cff650b8ffb83f444e51ce35348580258` (kind CONDITION).
- Needle 「納税者又は特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下水利地益税等について同様とする。）までに水利地益税等に係る地方団体の徴収金を完納しない場合においては、徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七百二十六条(1)の水利地益税等について納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2403 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・更正決定時の納期限読替・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2400 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2403 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 755/755 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
