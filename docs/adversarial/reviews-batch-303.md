# Adversarial review — batch 303

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
gitignored `build/batch303_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path traversing
MainProvision only (no 附則), short scoped text, a threshold marker
(以上 / 以下 / 超え / 以内 / をこえる) and exactly one distinct kanji numeral >= 2
(never statutory literal 1, never a 百分/千分 rate clause). The qualifying
numeral was additionally required to sit directly on the threshold marker, and
no numeral-only/section-reference match was accepted. Several further candidates
were REPLACED after pre-validation: five 地方税法 art. 34 insurance-premium
deduction candidates whose needles were not verbatim in the scoped article +
paragraph of the raw JSON (table/column pin mismatch); the art. 154
「一・五リットル」/「一トンを超え二トン以下」 candidates (fractional statute
whose kanji digit is not the statutory literal, two-threshold range, and a
statutory literal 1); and rate clauses such as 「百分の八・四」/「百分の一・二」
where N/100 is not exactly the clause rate. Existing `JapanTaxLaw/*.lean`, the
transcription checks, `data/TRANSCRIPTION_CHECK_REGISTRY.json` and the durable
transcription pins were searched first; none of these five units was previously
modelled. Each candidate was then pre-validated by importing
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

### InheritanceTax19_3RepeatedDeductionFloor2.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第十九条の三 (Num 19_3), paragraph 3 (本則),
  `LawBody[3]/MainProvision/MainProvision[1]/Article:19_3/Article#19_3/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|320f450b10e687679587d2814c86fc8fab87de00105a01d21d33a00174a3d41b` (kind REFERENCE).
- Needle 「第一項の規定に該当する者がその者又はその扶養義務者について既に前二項の規定による控除を受けたことがある者である場合においては、その者又はその扶養義務者がこれらの規定による控除を受けることができる金額は、既に控除を受けた金額の合計額が第一項の規定による控除を受けることができる金額（二回以上これらの規定による控除を受けた場合には、最初に相続又は遺贈により財産を取得した際に同項の規定による控除を受けることができる金額）に満たなかつた場合におけるその満たなかつた部分の金額の範囲内に限」;
  二回以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 2 = true` (threshold_at), `inScopeBool 3 = true` (threshold_above) — zero, small_input, threshold_at, threshold_above (4 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `2 ≤ times` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第十九条の三(3)の扶養義務者等が二回以上控除を受けた場合の控除額の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2388 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（既控除額の合計額との比較・満たなかつた部分の範囲・第一項の控除額算定・他項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax8_2SuccessorMunicipalitiesTwoOrMore.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第八条の二 (Num 8_2), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:8_2/Article#8_2/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|89c650f9534ab2e9b9799e0f28360499115842268f6025843a75720d1e080b6b` (kind CONDITION).
- Needle 「前項の規定によつて消滅市町村の徴収金に係る権利を承継する承継市町村が二以上ある場合において、当該承継市町村がそれぞれ承継すべき当該消滅市町村の徴収金に係る権利について当該承継市町村の長の間において意見を異にし、その協議がととのわないときは、道府県知事（当該承継市町村が二以上の道府県の区域にわたる場合においては、総務大臣）に対し、その決定を求める旨を申し出なければならない。」;
  二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 2 = true` (threshold_at), `inScopeBool 3 = true` (threshold_above) — zero, small_input, threshold_at, threshold_above (4 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `2 ≤ municipalities` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第八条の二(2)の消滅市町村の徴収金の権利を承継する市町村が二以上の場合の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2388 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（承継すべき権利の意見の異同・協議の不成立・申出先の指定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax73_2AnnexFilingWithin30Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の二 (Num 73_2), paragraph 7 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_2/Article#73_2/Paragraph#7/ParagraphSentence/Sentence#2`.
- Normative unit `NORM|2ab181f2a0af4fd936e65bd138b4d217fa6516f4fd97639d3adb4a371b91146e` (kind CONDITION).
- Needle 「この場合においては、主体構造部の取得者が納税通知書の交付を受けた日から三十日以内に、附帯設備に属する部分の取得者と協議の上、当該不動産取得税の課税標準となるべき価額のうち附帯設備に属する部分の取得者の所有に属する部分の価額を申し出たときは、その部分の価額に基づいて附帯設備に属する部分の取得者に不動産取得税を課するものとし、主体構造部の取得者に課した不動産取得税の税額から附帯設備の取得者に課した不動産取得税の税額に相当する額を減額するものとする。」;
  三十日以内 is INCLUSIVE (`≤`), so 30 is inside and 31 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 29 = true` (threshold_below), `inScopeBool 30 = true` (threshold_at (inclusive)), `inScopeBool 31 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `days ≤ 30` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十三条の二(7)の附帯設備に属する部分の価額を三十日以内に申し出る場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2388 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（課税標準の按分・税額の減額計算・申出の内容・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax73_27_2HousingTaxDeferralWithin6Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の二十七の二 (Num 73_27_2), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_27_2/Article#73_27_2/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|c168278a98a5e0a24ca6f3e4afc9fe43c1702de97aef1f0c2178d7fd8d16d64f` (kind CONDITION).
- Needle 「道府県は、住宅の取得に対して課する不動産取得税を賦課徴収する場合において、当該住宅の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から六月以内の期間を限つて、当該住宅に係る不動産取得税額のうち同項の規定により減額すべき額に相当する税額を徴収猶予するものとする。」;
  六月以内 is INCLUSIVE (`≤`), so 6 is inside and 7 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 5 = true` (threshold_below), `inScopeBool 6 = true` (threshold_at (inclusive)), `inScopeBool 7 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `months ≤ 6` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十三条の二十七の二(2)の住宅取得に対する不動産取得税の六月以内の徴収猶予期間の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2388 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（申告の真実性・減額額の算定・条例の定め・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax693MunicipalExternalTaxDemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第六百九十三条 (Num 693), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:693/Article#693/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|1fab83040af4ceb15ec556cb6e8bef5059baec0ba454ef99fb7f434f6b2afb57` (kind CONDITION).
- Needle 「納税者又は特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下市町村法定外普通税について同様とする。）までに市町村法定外普通税に係る地方団体の徴収金を完納しない場合においては、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第六百九十三条(1)の市町村法定外普通税について納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2388 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・更正決定時の納期限読替・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2385 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2388 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 750/750 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
