# Adversarial review — batch 307

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshots: two from
相続税法 (law 325AC0000000073) and three from 地方税法 (law 325AC0000000226).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item, where noted) of the named
`source_path` — never accepted as a number found merely somewhere in the whole
law text. The queue records were filtered with ONE mmap pass over
`build/task_queue.json` (candidates cached under gitignored
`build/batch307_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path traversing
MainProvision only (no 附則), short scoped text, a threshold marker
(以上 / 以下 / 超え / 以内 / をこえる), and a single kanji numeral >= 2 attached
to that marker (never a statutory literal 1 as the qualifying threshold, never
a 百分/千分 rate clause, never a numeral-only/section-reference match). During
pre-validation 358 further candidates were REPLACED: 321 had no single
qualifying threshold numeral attached to the marker (section-reference-only
「以下」 or multiple competing thresholds); 297 had their spec numeral absent
from the scoped clause (`clause_correspondence` false); 63 had needles that were
not verbatim and unique in the pinned article + paragraph (table/column pin
mismatch, e.g. the 地方税法 art. 34 insurance-premium deduction cells and the
art. 154 「一トンを超え、二トン以下」/「一・五リットル以下」 rows);
23 used fractional numeral notation (e.g. 「一・五リットル」); and 12 were rate
clauses such as 「百分の八・四」 where N/100 is not exactly the clause rate.
Existing `JapanTaxLaw/*.lean`, the transcription checks,
`data/TRANSCRIPTION_CHECK_REGISTRY.json` and the durable transcription pins
were searched first; none of these five units was previously modelled. Each
candidate was then pre-validated by importing
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
(9-11 here) covering >= 3 distinct boundary categories. 「以上」/「以下」/「以内」
are INCLUSIVE; 「を超え」/「をこえる」/「を超える」 are STRICT. No statutory
literal 1 is used as a threshold value in any spec. The single-literal
`百分のN` ceiling/floor is used only where N/100 is exactly the clause rate
(none of these five units uses one). All boundary examples are kernel-decided
(`by unfold …; decide`, plus `inScopeBool N = bool := by decide`), not asserted
by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax27JointReturnTwoOrMore.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第二十七条 (Num 27), paragraph 5 (本則),
  `LawBody[3]/MainProvision/MainProvision[3]/Article:27/Article#27/Paragraph#5/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|b57c14ffe5e08ed7df8104720224b0e391927073925885c5261e22abfae0372f` (kind READING).
- Needle 「同一の被相続人から相続又は遺贈により財産を取得した者又はその者の相続人で第一項、第二項（次条第二項において準用する場合を含む。）又は第三項の規定により申告書を提出すべきもの又は提出することができるものが二人以上ある場合において、当該申告書の提出先の税務署長が同一であるときは、これらの者は、政令で定めるところにより、当該申告書を共同して提出することができる。」;
  二人以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 2 = true` (threshold_at), `inScopeBool 3 = true` (threshold_above) — zero, small_input, threshold_at, threshold_above (4 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `2 ≤ persons` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第二十七条(5)の申告書を提出すべき者が二人以上の場合の共同申告の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2418 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（各項の申告書提出者の範囲・政令手続・共同申告の効力・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### InheritanceTax42CorrectionWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第四十二条 (Num 42), paragraph 10 (本則),
  `LawBody[3]/MainProvision/MainProvision[5]/Article:42/Article#42/Paragraph#10/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|b9a19904c52f432cc27608eae1e49d46c33cba41eb2dd69ce9193344ebd923e8` (kind REFERENCE).
- Needle 「第八項の規定により申請書の訂正又は物納手続関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該物納手続関係書類の訂正若しくは提出をしなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四十二条(10)の物納手続関係書類の訂正等を二十日以内にする場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2418 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第八項の訂正要求・前項の通知・訂正内容・提出手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax8AppealWithin30Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第八条 (Num 8), paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:8/Article#8/Paragraph#4/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|06691e01250357a799be279903bb436a54e521f74978d57d04bcd78345838e15` (kind REFERENCE).
- Needle 「第二項の規定による道府県知事の決定に不服がある市町村長は、同項の通知を受けた日から三十日以内に総務大臣に裁決を求める旨を申し出ることができる。」;
  三十日以内 is INCLUSIVE (`≤`), so 30 is inside and 31 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 29 = true` (threshold_below), `inScopeBool 30 = true` (threshold_at (inclusive)), `inScopeBool 31 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `days ≤ 30` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第八条(4)の道府県知事の決定に不服な市町村長が三十日以内に裁決を求める場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2418 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第二項の決定・不服認定・裁決手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax72_3TwoOrMoreBeneficiaries.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の三 (Num 72_3), paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_3/Article#72_3/Paragraph#4/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|f4567b2caecd6a1400acb766d6c3a9ac0766e1f9fcb68b31ab782027334563ef` (kind DELEGATION).
- Needle 「受益者が二以上ある場合における第一項の規定の適用、第二項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前三項の規定の適用に関し必要な事項は、政令で定める。」;
  二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 2 = true` (threshold_at), `inScopeBool 3 = true` (threshold_above) — zero, small_input, threshold_at, threshold_above (4 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `2 ≤ beneficiaries` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十二条の三(4)の受益者が二以上の場合に政令で必要事項を定める場合の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2418 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第一項適用・第二項の該当判定・前三項適用・政令内容・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax73_7SecurityTransferWithin2Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の七 (Num 73_7), paragraph 1, item 8 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_7/Article#73_7/Paragraph#1/Item#8/ItemSentence/Sentence#1`.
- Normative unit `NORM|0c121d65f6bde4fedcf3585e707a6a13b667898763dde25c2332288d5b2e2492` (kind EXCEPTION).
- Needle 「譲渡により担保の目的となつている財産（以下この節において「譲渡担保財産」という。）により担保される債権の消滅により当該譲渡担保財産の設定の日から二年以内に譲渡担保財産の権利者（以下この節において「譲渡担保権者」という。）から譲渡担保財産の設定者（設定者が更迭した場合における新設定者を除く。以下この節において同じ。）に当該譲渡担保財産を移転する場合における不動産の取得」;
  二年以内 is INCLUSIVE (`≤`), so 2 is inside and 3 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 2 = true` (threshold_at), `inScopeBool 3 = false` (threshold_above) — zero, small_input, threshold_at, threshold_above (4 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `years ≤ 2` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七十三条の七(1)の譲渡担保財産を設定の日から二年以内に設定者へ移転する場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界4区分 + lake build 2418 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（債権消滅・設定者更迭・用語定義・不動産取得税の課税・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2415 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2418 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 760/760 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
