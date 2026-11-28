# Adversarial review — batch 327

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshot of 地方税法
(law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880275059 bytes;
40275 `NOT_STARTED` records; 398 candidates cached under gitignored
`build/batch327_candidates.json`). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars) and a threshold marker (以上 / 以下 / 超え / 以内 / をこえ).

Candidates that FAILED the mandatory pre-validation were REPLACED, never
promoted: 地方税法 art. 321_8_2(1) 「…更正の通知をした日から二月以内…更正の請求を
することができる」 (0.9781 difflib similarity to the already-modelled
`LocalTax53_2CorrectionRequestWithin2Months` — same clause with 道府県知事 instead
of 市町村長) and art. 358(1) 「…固定資産税の全部又は一部を免れた…五年以下の拘禁刑」
(0.9615 similarity to the already-modelled 鉱区税 / 自動車税 five-year evasion
units) were dropped in favour of genuinely distinct needles. Also rejected:
地方税法 art. 154 table cells such as 「最大積載量が一トンを超え、二トン以下のもの」
(needle absent from the scoped article + paragraph of its table `source_path`),
the rate clauses art. 314_4(1) 「百分の八・四を超えることができない」, art. 321(3)
「百分の一に…十四日以下」, art. 350(2) 「三分の二を超える…百分の一・七」 and
art. 349_4 「大規模の償却資産が二以上…」 (spec numerals not located in the
clause, basis not `spec numerals / rate ratio in clause`), the standalone
十分の五以上 ratio fragments of 相続税法 art. 38/52 (a 5/10 ratio, not a
standalone literal 5), and the 地方税法 art. 144 「〇・八〇一七を超え」 fractional
artifact (a digit inside a decimal, not a threshold). All five finalised units
here carry exactly one single kanji digit (>= 2) attached to their threshold
marker, and each whole needle is absent from `JapanTaxLaw/*.lean`, the
transcription checks, the check registry and the durable pins (whole-needle
search plus a difflib near-duplicate sweep, not merely a substring match).

Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` (640 modules at pre-selection, 645 after
the transcription yields were added) and `tq.build_tasks` for 地方税法
(38,410 tasks), and confirming verifiable kind, empty `unhandled_conditions`,
no UNRESOLVED unit, `clause_correspondence` True with basis
`spec numerals / rate ratio in clause`, unit text inside
`scoped_article_text(law, article, needles)`, coverage exact + unique ids, a
source path, SHA-256 pin, revision match, and verbatim law/revision/needle
presence in the article + paragraph of the raw JSON (one scoped hit). All five
units passed (`build/batch327_preselect.out`, `PRESELECT_OK`;
`build/batch327_final_prevalidation.out`, `MANDATORY_PREVALIDATION_ALL_OK True`).
The generated Spec.lean files were re-checked so that statutory literals live
only inside `def specInScope` before the first `theorem ` marker, with an
independent formula (no implementation identifier), a universal axiom-free
bridge, a Decidable Bool mirror, and 5 distinct kernel-decided boundary
categories in every module. Units are genuine numeric thresholds, never
numeral-only matches: 二年以下, 三年以下, 三年以下, 二年以下 and 三年以下 — each a
single kanji numeral >= 2 attached to its threshold marker. 
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT. No statutory
literal 1 is used as a threshold value in any spec (single spec literals:
2, 3, 3, 2, 3). The single-literal `百分のN` rule does not apply to any of
these units. All boundary examples are kernel-decided (`by unfold ...; decide`,
`by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax22SecrecyDisclosureUpTo2Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（地方税の調査事務従事者が知り得た秘密を漏らし、又は窃用した場合の二年以下の拘禁刑 (years <= 2) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2568 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（百万円以下の罰金・両罰規定・犯則事件の調査手続・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 22, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:22/Article#22/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|9880699951db4e5a92068bccce60abdcad16e103a21ff4c16369578f7ceac728` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「地方税に関する調査（不服申立てに係る事件の審理のための調査及び地方税の犯則事件の調査を含む。）若しくは租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律（昭和四十四年法律第四十六号）の規定に基づいて行う情報の提供のための調査に関する事務又は地方税の徴収に関する事務に従事している者又は従事していた者は、これらの事務に関して知り得た秘密を漏らし、又は窃用した場合においては、二年以下の拘禁刑又は百万円以下の罰金に処する。」;
  地方税の調査事務従事者が知り得た秘密を漏らし、又は窃用した場合の二年以下の拘禁刑 (years <= 2) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input / threshold_below), 2 = true (threshold_at, INCLUSIVE), 3 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 2` from statutory literals only
  (single literal 2, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax95GolfObstructionUpTo3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ゴルフ場利用税の特別徴収義務者が滞納処分の執行を免れる目的で財産を隠蔽等した場合の三年以下の拘禁刑 (years <= 3) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2568 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（二百五十万円以下の罰金・併科・滞納処分の認定・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 95, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:95/Article#95/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|1285ffe8a8a824a7787b3db7826c58832e253aac9767e562b9d8f8b82bc2eba5` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「ゴルフ場利用税の特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは道府県の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」;
  ゴルフ場利用税の特別徴収義務者が滞納処分の執行を免れる目的で財産を隠蔽等した場合の三年以下の拘禁刑 (years <= 3) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 2 = true (threshold_below), 3 = true (threshold_at, INCLUSIVE), 4 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 3` from statutory literals only
  (single literal 3, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax71_61StockTransferObstructionUpTo3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（株式等譲渡所得割の特別徴収義務者が滞納処分の執行を免れる目的で財産を隠蔽等した場合の三年以下の拘禁刑 (years <= 3) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2568 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（二百五十万円以下の罰金・併科・滞納処分の認定・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 71_61, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:71_61/Article#71_61/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|9bd7c7bd57ab21b3260c7176bc90ca8759c48a7a707e5e2a7af1c041beb2d31b` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「株式等譲渡所得割の特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは道府県の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」;
  株式等譲渡所得割の特別徴収義務者が滞納処分の執行を免れる目的で財産を隠蔽等した場合の三年以下の拘禁刑 (years <= 3) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 2 = true (threshold_below), 3 = true (threshold_at, INCLUSIVE), 4 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 3` from statutory literals only
  (single literal 3, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax144_33UnapprovedOilUpTo2Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（道府県知事の承認を受けないで炭化水素油に係る行為をし、又は不正の手段により承認を受けた場合の二年以下の拘禁刑 (years <= 2) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2568 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（百万円以下の罰金・承認の認定・第三号第四号の行為の内容・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 144_33, paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:144_33/Article#144_33/Paragraph#4/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|e9b25c324881b3b0fca31436899c8a8db88c7146f706f23e1a1af241c254ba55` (kind REFERENCE); dependency-free and `NOT_STARTED`.

- Needle 「前条第一項の規定に違反して道府県知事の承認を受けないで同項第三号若しくは第四号の行為を行つたとき、又は偽りその他不正の手段により同項の承認を受けたときは、その違反行為をした者は、二年以下の拘禁刑又は百万円以下の罰金に処する。」;
  道府県知事の承認を受けないで炭化水素油に係る行為をし、又は不正の手段により承認を受けた場合の二年以下の拘禁刑 (years <= 2) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input / threshold_below), 2 = true (threshold_at, INCLUSIVE), 3 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 2` from statutory literals only
  (single literal 2, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax332MunicipalObstructionUpTo3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（市町村民税の納税者又は特別徴収義務者が滞納処分の執行を免れる目的で財産を隠蔽等した場合の三年以下の拘禁刑 (years <= 3) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2568 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（二百五十万円以下の罰金・併科・滞納処分の認定・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 332, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:332/Article#332/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|16920301e53fa5dcd67161775d25fbb218eeb7f7ba801995d9b34ea147d52f32` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「市町村民税の納税者又は特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは市町村の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」;
  市町村民税の納税者又は特別徴収義務者が滞納処分の執行を免れる目的で財産を隠蔽等した場合の三年以下の拘禁刑 (years <= 3) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 2 = true (threshold_below), 3 = true (threshold_at, INCLUSIVE), 4 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary as `years <= 3` from statutory literals only
  (single literal 3, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2565 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2568 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 810/810 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
- `MANDATORY_PREVALIDATION_ALL_OK True` — every id pre-validated before finalisation.
