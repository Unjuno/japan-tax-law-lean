# Adversarial review — batch 301

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 地方税法 snapshot (all five
surviving units are from law 325AC0000000226; no 相続税法 unit survived the
filters — its remaining threshold clauses were either already modelled or
numerals used only as 条項/号 section references, i.e. numeral-only matches).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (candidates cached under
gitignored `build/batch301_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path traversing
MainProvision only (no 附則), short scoped text, a threshold marker
(以上 / 以下 / 超え / 以内 / をこえる) and exactly one kanji numeral >= 2
(never statutory literal 1, never a 百分/千分 rate clause). The qualifying
numeral was additionally required to sit directly on the threshold marker, and
no numeral-only/section-reference match was accepted. Four further candidates
were REPLACED after pre-validation: three used fractional statutes
(「一・五リットル」 — the kanji digit 五 is not the statutory literal 5), and one
was a two-threshold 積載量 range pinned in an Item/Column whose needle was not
verbatim in the scoped article + paragraph (and which carried a statutory
literal 1). Existing `JapanTaxLaw/*.lean`, the transcription checks,
`data/TRANSCRIPTION_CHECK_REGISTRY.json` and the durable transcription pins
were searched first; none of these five units was previously modelled. Each
candidate was then pre-validated by importing
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
bridge, a Decidable Bool mirror, and >= 5 kernel-decided examples covering >= 3
distinct boundary categories. 「以上」/「以下」/「以内」 are
INCLUSIVE; 「を超え」/「をこえる」/「を超える」 are STRICT. No statutory literal 1 is
used as a threshold value in any spec. The single-literal `百分のN`
ceiling/floor is used only where N/100 is exactly the clause rate (none of
these five units uses one). All boundary examples are kernel-decided
(`by unfold …; decide`, plus `inScopeBool N = bool := by decide`), not asserted
by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax144_25ExemptionCertTransferFineCeiling500k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百四十四条の二十五 (Num 144_25), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:144_25/Article#144_25/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|b11d0e0ba6f95c2688dacb61262b0c536bcbf286bcd3946b7ce13e4b01c2d0ce` (kind REFERENCE).
- Needle 「前条の規定に違反したときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」;
  五十万円以下 is INCLUSIVE (`≤`), so 500000 is inside and 500001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 499999 = true` (threshold_below), `inScopeBool 500000 = true` (threshold_at (inclusive)), `inScopeBool 500001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 500000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第百四十四条の二十五(1)の免税証の譲渡禁止違反に対する罰金五十万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2373 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（一年以下の拘禁刑・第二項の千万円以下の罰金・法人両罰・時効・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax144_28ExemptOilFalseReportFineCeiling500k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百四十四条の二十八 (Num 144_28), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:144_28/Article#144_28/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|43dd8fba6be6d2f78904475c84a186ca2ce2a4dc5d0008d99fa379b05ed0afa8` (kind REFERENCE).
- Needle 「前条第一項の規定に違反して報告書を提出せず、又は虚偽の記載をした報告書を提出したときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」;
  五十万円以下 is INCLUSIVE (`≤`), so 500000 is inside and 500001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 499999 = true` (threshold_below), `inScopeBool 500000 = true` (threshold_at (inclusive)), `inScopeBool 500001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 500000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第百四十四条の二十八(1)の免税軽油報告書の未提出・虚偽記載に対する罰金五十万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2373 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（一年以下の拘禁刑・法人両罰・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax701_53BathingTaxFalseReturnFineCeiling500k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百一条の五十三 (Num 701_53), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:701_53/Article#701_53/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|2f008909fc986c33e790089af9b57c8a4b0deed2ff947dbd149ad948e4017580` (kind REFERENCE).
- Needle 「前条の規定により申告すべき事項について虚偽の申告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」;
  五十万円以下 is INCLUSIVE (`≤`), so 500000 is inside and 500001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 499999 = true` (threshold_below), `inScopeBool 500000 = true` (threshold_at (inclusive)), `inScopeBool 500001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 500000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七百一条の五十三(1)の入湯税の虚偽申告に対する罰金五十万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2373 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（一年以下の拘禁刑・前条の要件該当性・情状判断・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax539MineralTaxDemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第五百三十九条 (Num 539), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:539/Article#539/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|675c1dda4d40519a8b082d55583af8dd9f9acec8c8e7a954fcdb41541d487be9` (kind CONDITION).
- Needle 「納税者が納期限（更正又は決定があつた場合においては、不足税額の納期限をいう。以下鉱産税について同様とする。）までに鉱産税に係る地方団体の徴収金を完納しない場合においては、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第五百三十九条(1)の鉱産税について納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2373 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・更正決定時の納期限読替・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax733_22ExtraPurposeTaxDemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百三十三条の二十二 (Num 733_22), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:733_22/Article#733_22/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|4fbe699b9565b6e7ffb04af04caf933d93b338b32c5b84a1457c74c9f654aa54` (kind CONDITION).
- Needle 「納税者又は特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下本節において同じ。）までに法定外目的税に係る地方団体の徴収金を完納しない場合においては、地方団体の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七百三十三条の二十二(1)の法定外目的税について納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2373 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・更正決定時の納期限読替・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2370 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2373 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 745/745 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
