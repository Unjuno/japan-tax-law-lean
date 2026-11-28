# Adversarial review — batch 331

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshot of 地方税法
(law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880271835 bytes;
40151 `NOT_STARTED` records; 374 candidates cached under gitignored
`build/batch331_candidates.json`). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars) and a threshold marker (以上 / 以下 / 超え / 以内 / をこえ).

Candidates that FAILED the mandatory pre-validation were REPLACED, never
promoted: 相続税法 art. 38/52 「十分の五以上」 (a 5/10 ratio, not a standalone
literal 5), 地方税法 art. 349_4(2) 「…大規模の償却資産が二以上…百分の百六十…」 and
art. 349_5(3) 「…二以上の第一次新設大規模償却資産…」 (spec numerals not in the
clause, basis not `spec numerals / rate ratio in clause`), art. 154 table cells
such as 「（２）　最大積載量が一トンを超え、二トン以下のもの」 and art. 314_2(7)
「…十年以上の期間…」 and art. 312(1) 「…五十億円を超える…五十人を超える…」
(needle absent from the scoped article + paragraph of the `source_path`),
art. 314_4(1) 「百分の八・四を超えることができない」 (rate fragment), and art. 72_95(1)
「次の各号のいずれかに該当する場合には…十年以下…」 (a bare framework penalty with no
described conduct — numeral-only style). Near-duplicate matches were also
rejected by a difflib sweep against every needle already in the tree:
art. 739_6(1) 三年以下 (0.8180 similarity to the already-modelled
`LocalTax332MunicipalObstructionUpTo3Years`), art. 144_22(1) ten-year
exemption-certificate fraud (0.8554 to `LocalTax144_25…`), art. 358(1) five-year
fixed-asset-tax evasion (0.9615), art. 71_20(3) 二年以下 (0.9604), art. 321_8_2(1)
二月以内 (0.9781 to `LocalTax53_2CorrectionRequestWithin2Months`), and the remaining
三年以下 / 五年以下 concealment and evasion families (>0.93). All five finalised
units carry exactly one statutory literal (100 / 1000 / 30 / 25000 / 1000000,
all >= 2) attached to their threshold marker 百人以下 / 千平方メートル以下 /
三十日以内 / 二万五千円を超える / 百万円を超える, and each whole needle is absent
from `JapanTaxLaw/*.lean`, the transcription checks, the check registry and the
durable pins (whole-needle search plus the difflib near-duplicate sweep).

Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` (650 modules at pre-selection) and
`tq.build_tasks` for 地方税法 (38,410 tasks), and confirming verifiable kind, empty
`unhandled_conditions`, no UNRESOLVED unit, `clause_correspondence` True with basis
`spec numerals / rate ratio in clause`, unit text inside
`scoped_article_text(law, article, needles)`, coverage exact + unique ids, a
source path, SHA-256 pin, revision match, and verbatim law/revision/needle
presence in the article + paragraph of the raw JSON (one scoped hit). All five
units passed (`build/batch331_final_preselect.out`, `PRESELECT_ALL_OK True`;
`build/batch331_final_prevalidation.out`, `MANDATORY_PREVALIDATION_ALL_OK True`).
The generated Spec.lean files were re-checked so that statutory literals live
only inside `def specInScope` before the first `theorem ` marker, with an
independent formula (no implementation identifier), a universal axiom-free
bridge, a Decidable Bool mirror, and 5 distinct kernel-decided boundary
categories in every module. Units are genuine numeric thresholds, never
numeral-only matches; each has one spec literal >= 2 attached to its marker.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」/「超え」 are STRICT. No statutory
literal 1 is used as a threshold value in any spec (single spec literals:
100, 1000, 30, 25000, 1000000). The single-literal `百分のN` rule does not apply
to any of these units. All boundary examples are kernel-decided
(`by unfold ...; decide`, `by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax701_43EmployeeCountUpTo100.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（事業所税の免税点の従業者の数の合計数が百人以下 (employees <= 100) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2598 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（千平方メートル以下の床面積・課税標準の算定期間中を通じて従業者の数に著しい変動がある事業所等の平均算定・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 701_43, paragraph 4 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:701_43/Article#701_43/Paragraph#4/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|36c7d273f80c1b2c2c199c55a55d2be0cceea637315b90f00fb86c1e57993c8a` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「前項の場合において、第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定の基礎となる事業所等のうち、課税標準の算定期間中を通じて従業者の数に著しい変動がある事業所等として政令で定めるもの（当該課税標準の算定期間の中途において廃止された事業所等を除く。）については、当該課税標準の算定期間に属する各月の末日現在における従業者の数を合計した数を当該課税標準の算定期間の月数で除して得た数をもつて前項の課税標準の算定期間の末日現在の従業者の数と」;
  事業所税の免税点の従業者の数の合計数が百人以下 (employees <= 100) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 99 = true (threshold_below), 100 = true (threshold_at, INCLUSIVE), 101 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 100, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax701_43FloorAreaUpTo1000Sqm.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（事業所床面積の合計面積が千平方メートル以下 (sqm <= 1000) の INCLUSIVE 上限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2598 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（百人以下の従業者数・第一項及び第二項の免税点・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 701_43, paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:701_43/Article#701_43/Paragraph#3/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|cc0c39fe14cafabb93799c35afb346c27749dfdaa8c2d1dbfdc28b58901bcf60` (kind REFERENCE); dependency-free and `NOT_STARTED`.

- Needle 「前二項の場合において、第一項に規定する事業所床面積の合計面積及び第二項に規定する事業所床面積が千平方メートル以下であるかどうか並びに第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定は課税標準の算定期間の末日の現況によるものとする。」;
  事業所床面積の合計面積が千平方メートル以下 (sqm <= 1000) の INCLUSIVE 上限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 999 = true (threshold_below), 1_000 = true (threshold_at, INCLUSIVE), 1_001 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 1_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax364_2CorrectionWithin30Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（納税通知書の交付を受けた日から三十日以内 (days <= 30) の INCLUSIVE 修正申出期限）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2598 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（仮算定税額の二分の一・書面による申出・第三項の市町村長の決定期限・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 364_2, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:364_2/Article#364_2/Paragraph#1/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|d9a7640f71c5f301296f038308f9fa398d6628f5ef2fcd0cc6e5a9b51d305eaf` (kind REFERENCE); dependency-free and `NOT_STARTED`.

- Needle 「前条第五項の固定資産に係る当該年度分の固定資産税額が仮算定税額の二分の一に相当する額に満たないこととなると認められる場合においては、同項の規定によつて当該固定資産に係る固定資産税を徴収されることとなる者は、同条第七項の納税通知書の交付を受けた日から三十日以内に市町村長に同条第五項の規定によつて徴収される固定資産税額の修正を申し出ることができる。」;
  納税通知書の交付を受けた日から三十日以内 (days <= 30) の INCLUSIVE 修正申出期限. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), 1 = true (small_input), 29 = true (threshold_below), 30 = true (threshold_at, INCLUSIVE), 31 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 30, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax34QuakePremiumCapOver25000Strict.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（地震保険料控除の算定基礎額が二万五千円を超える場合に二万五千円を限度とする STRICT 上限 (yen > 25000)）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2598 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（二分の一の算定・剰余金又は割戻金の控除・他の所得控除の号・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 34, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:34/Article#34/Paragraph#1/Item#5_3/ItemSentence/Column#2/Sentence#1`.

- Normative unit `NORM|6d745a0c6801597941436638fda3d3cbf40be38765f614224cf6f898d650440c` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「前年中に支払つた地震保険料の金額の合計額（前年中において損害保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は損害保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて地震保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（地震保険料に係る部分の金額に限る。）を控除した残額）の二分の一に相当する金額（その金額が二万五千円を超える場合には、二万五千円）」;
  地震保険料控除の算定基礎額が二万五千円を超える場合に二万五千円を限度とする STRICT 上限 (yen > 25000). The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), 1 = false (small_input), 24_999 = false (threshold_below), 25_000 = false (threshold_at, exclusive), 25_001 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 25_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

### LocalTax72_110RefundTripleOver1MStrict.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（還付金額の三倍が百万円を超える場合の罰金加重の STRICT 閾値 (yen > 1000000)）, 
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2598 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第一項の犯罪・十年以下の拘禁刑・三倍以下の上限・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 72_110, paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_110/Article#72_110/Paragraph#2/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|35eec1cdf63c6ee652e967367315a5ae192ef8b818dc09449864eb4ae9648f46` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「前項の還付を受けた金額の三倍が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超え当該相当額の三倍以下の額とすることができる。」;
  還付金額の三倍が百万円を超える場合の罰金加重の STRICT 閾値 (yen > 1000000). The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), 1 = false (small_input), 999_999 = false (threshold_below), 1_000_000 = false (threshold_at, exclusive), 1_000_001 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 1_000_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker.

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2595 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2598 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 820/820 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
- `MANDATORY_PREVALIDATION_ALL_OK True` — every id pre-validated before finalisation.
