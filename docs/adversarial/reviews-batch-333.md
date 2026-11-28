# Adversarial review — batch 333

Mechanical (not human) independent re-extraction of five dependency-free,
single-statutory-literal normative units from the pinned e-Gov snapshot of
地方税法 (law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880271835 bytes;
40151 `NOT_STARTED` records; 374 candidates cached under gitignored
`build/batch333_candidates.json`). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars), a threshold marker (以上 / 以下 / 超え / 以内 / をこえ) and a
kanji numeral >= 2.

Candidates that FAILED the mandatory pre-validation were REPLACED, never
promoted: 相続税法 art. 38/52 「十分の五以上」 (a 5/10 ratio, not a standalone
literal 5), 地方税法 art. 314_4(1) 「百分の八・四を超えることができない」 and
art. 350(2) 「百分の一・七を超える…」 (rate fragments), art. 72_95(1)
「次の各号のいずれかに該当する場合には…十年以下…」 (a bare framework penalty
with no described conduct — numeral-only style), and the entire family of
三年以下 / 二年以下 / 五年以下 / 十年以下 concealment and evasion penalties
(difflib ratio 0.85–0.98 against already-modelled needles). Table cells whose
needle could not be found uniquely in the pinned article+paragraph were also
rejected (e.g. art. 154 「（２）　最大積載量が一トンを超え、二トン以下のもの」).
All five finalised units carry exactly one statutory literal (>= 2) in the
independent spec, attached to their threshold marker 五千人以上 / 千万円以下 /
八十四万一円を超える / 十年以上 / 一万人以上; each whole needle is absent from
`JapanTaxLaw/*.lean`, the transcription checks, the check registry and the
durable pins (whole-needle search plus a difflib near-duplicate sweep; the
two sister units from art. 349_4 score 0.8125 against each other, below the
0.85 rejection bar, and are distinct needles with distinct literals).

Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` (655 modules at pre-selection; 660 after
the five transcription yields were added) and `tq.build_tasks` for 地方税法
(38,410 tasks), and confirming verifiable kind,
empty `unhandled_conditions`, no UNRESOLVED unit, `clause_correspondence` True with basis
`spec numerals / rate ratio in clause`, unit text inside
`scoped_article_text(law, article, needles)`, coverage exact + unique ids, a
source path, SHA-256 pin, revision match, and verbatim law/revision/needle
presence in the article + paragraph of the raw JSON (one scoped hit). All five
units passed (`build/batch333_preselect3.out`, 25 pre-validated good candidates;
`build/batch333_final_prevalidation.out`, `MANDATORY_PREVALIDATION_ALL_OK True`).
The generated Spec.lean files were re-checked so that statutory literals live
only inside `def specInScope` before the first `theorem ` marker, with an
independent formula (no implementation identifier), a universal axiom-free
bridge, a Decidable Bool mirror, and 5 distinct kernel-decided boundary
categories in every module. Units are genuine numeric thresholds, never
numeral-only matches; each has one spec literal >= 2 attached to its marker.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」/「超え」 are STRICT. No statutory
literal 1 is used as a threshold value in any spec (single spec literals:
5000, 10000000, 840001, 10, 10000). The single-literal `百分のN` rule does not
apply to any of these units. All boundary examples are kernel-decided
(`by unfold ...; decide`, `by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax349_4PopulationOver5000Inclusive.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 五千人以上 (population >= 5000) INCLUSIVE lower bound of the 基準財政収入 populous-municipality bracket in 地方税法 art. 349_4(1). The 一万人未満 upper bound, the 基準財政需要額 calculations, other brackets and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2613 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 349_4, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:349_4/Article#349_4/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`.

- Normative unit `NORM|dfd8bb51ddff64572c4e3d1e87eaabcd4ce91dee97ab536716316cde06f5e7cf` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「人口五千人以上一万人未満の市町村」;
  ONLY the 五千人以上 (population >= 5000) INCLUSIVE lower bound of the 基準財政収入 populous-municipality bracket in 地方税法 art. 349_4(1). The 一万人未満 upper bound, the 基準財政需要額 calculations, other brackets and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input), inScopeBool 4_999 = false (threshold_below), inScopeBool 5_000 = true (threshold_at (inclusive)), inScopeBool 5_001 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 5_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「五千人以上」 is INCLUSIVE (threshold itself qualifies).

### LocalTax312CapitalUpTo10MInclusive.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 千万円以下 (capital <= 10000000) INCLUSIVE ceiling for a 法人 with 資本金等の額 in the 均等割 table of 地方税法 art. 312(1). The 従業者数が五十人を超える condition, the other capital brackets and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2613 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 312, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:312/Article#312/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`.

- Normative unit `NORM|82b5d452e759278a730ae118ce1e565cab72d260e596b3731c5f137900f63550` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「二　資本金等の額を有する法人で資本金等の額が千万円以下であるもののうち、従業者数の合計数が五十人を超えるもの」;
  ONLY the 千万円以下 (capital <= 10000000) INCLUSIVE ceiling for a 法人 with 資本金等の額 in the 均等割 table of 地方税法 art. 312(1). The 従業者数が五十人を超える condition, the other capital brackets and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), inScopeBool 1 = true (small_input), inScopeBool 9_999_999 = true (threshold_below), inScopeBool 10_000_000 = true (threshold_at (inclusive)), inScopeBool 10_000_001 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 10_000_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「千万円以下」 is INCLUSIVE (threshold itself qualifies).

### LocalTax314_2DependentExcessOver840001Strict.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 八十四万一円を超える (yen > 840001) STRICT excess over the 特定親族 income base in 地方税法 art. 314_2(1). The 六十三万円 base, the 二を乗じた金額 formula, the 十万円 rounding and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2613 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 314_2, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:314_2/Article#314_2/Paragraph#1/Item#12/Subitem1#2/Subitem1Sentence/Column#2/Sentence#1`.

- Normative unit `NORM|3a21ded59fc74d83829f2435d77387a9f9fd417f57b683650fb488f15aa3fa5c` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「六十三万円から当該特定親族の前年の合計所得金額のうち八十四万一円を超える部分の金額に二を乗じた金額（当該乗じた金額が十万円の整数倍の金額から八万円を控除した金額でないときは、十万円の整数倍の金額から八万円を控除した金額で当該乗じた金額に満たないもののうち最も多い金額とする。）を控除した金額」;
  ONLY the 八十四万一円を超える (yen > 840001) STRICT excess over the 特定親族 income base in 地方税法 art. 314_2(1). The 六十三万円 base, the 二を乗じた金額 formula, the 十万円 rounding and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input), inScopeBool 840_000 = false (threshold_below), inScopeBool 840_001 = false (threshold_at (exclusive)), inScopeBool 840_002 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 840_001, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「八十四万一円を超える」 is STRICT (threshold itself does NOT qualify).

### LocalTax314_2_7AnnuityAtLeast10YearsInclusive.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 十年以上 (years >= 10) INCLUSIVE annuity payment period in 地方税法 art. 314_2(7). The 六十歳に達した日以後, the 生存している期間 alternative, the 政令で定める要件 and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2613 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 314_2, paragraph 7 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:314_2/Article#314_2/Paragraph#7/Item#4/Subitem1#3/Subitem1Sentence/Sentence#1`.

- Normative unit `NORM|6174c8deca60247c032c2d041cdd5ac7b8f08f542b35f67913e9a49c0c78baa4` (kind DELEGATION); dependency-free and `NOT_STARTED`.

- Needle 「当該契約に基づくイに定める個人に対する年金の支払は、当該年金の受取人の年齢が六十歳に達した日以後の日で当該契約で定める日以後十年以上の期間又は当該受取人が生存している期間にわたつて定期に行うものであることその他の政令で定める要件」;
  ONLY the 十年以上 (years >= 10) INCLUSIVE annuity payment period in 地方税法 art. 314_2(7). The 六十歳に達した日以後, the 生存している期間 alternative, the 政令で定める要件 and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input), inScopeBool 9 = false (threshold_below), inScopeBool 10 = true (threshold_at (inclusive)), inScopeBool 11 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 10, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「十年以上」 is INCLUSIVE (threshold itself qualifies).

### LocalTax349_4PopulationOver10000Inclusive.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 一万人以上 (population >= 10000) INCLUSIVE lower bound of the 基準財政収入 municipality bracket in 地方税法 art. 349_4(1). The 三万人未満 upper bound, the 基準財政需要額 calculations, other brackets and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2613 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 349_4, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:349_4/Article#349_4/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`.

- Normative unit `NORM|ac8394db50c60dfad20bd6bef83505da75ec3e0438648cc6035032a6abe83a07` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「人口一万人以上三万人未満の市町村」;
  ONLY the 一万人以上 (population >= 10000) INCLUSIVE lower bound of the 基準財政収入 municipality bracket in 地方税法 art. 349_4(1). The 三万人未満 upper bound, the 基準財政需要額 calculations, other brackets and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input), inScopeBool 9_999 = false (threshold_below), inScopeBool 10_000 = true (threshold_at (inclusive)), inScopeBool 10_001 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 10_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「一万人以上」 is INCLUSIVE (threshold itself qualifies).

