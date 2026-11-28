# Adversarial review — batch 335

Mechanical (not human) independent re-extraction of five dependency-free,
single-statutory-literal normative units from the pinned e-Gov snapshot of
地方税法 (law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (880271627 bytes;
40143
`NOT_STARTED` records; 370 candidates cached under gitignored
`build/batch335_candidates.json`). Filtering kept law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
verifiable kind, empty `unhandled_conditions`, exact coverage + unique ids,
a source path traversing MainProvision only (no 附則), short scoped text
(<300 chars), a threshold marker (以上 / 以下 / 超え / 以内 / をこえ) and a
kanji numeral >= 2. The candidate cache was built against the CURRENT tree, so
needles already modelled by earlier batches (including batch 333) were excluded.

Candidates that FAILED the mandatory pre-validation were REPLACED, never
promoted: 相続税法 art. 38/52 「十分の五以上」 (a 5/10 ratio, not a standalone
statutory literal), 地方税法 art. 314_4(1) 「百分の八・四を超えることができない」 and
art. 350(2) 「百分の一・七を超える…」 (rate fragments), art. 321(3) 「百分の一」 (literal 1
rate ceiling), art. 448 「〇・〇五リットル」 / 「〇・〇九リットル」 (decimal fragments whose
kanji-digit match would misstate the statute), art. 349_4(2) / 349_5(3) 「二以上」
(numeral-only asset counts), art. 154 table cells with `・` decimals or two
scoped hits, and the entire family of 三年以下 / 二年以下 / 五年以下 / 十年以下
concealment and evasion penalties (difflib ratio 0.85–0.98 against already
modelled needles). Each finalised unit carries exactly one statutory literal
(>= 2) in the independent spec, attached to its threshold marker
六千人以上 / 三万五千人以上 / 千万円を超える / 千万円以下 / 九百五十万円以下; each whole
needle is absent from `JapanTaxLaw/*.lean`, the transcription checks, the check
registry and the durable pins (whole-needle search plus a difflib near-duplicate
sweep; the two sister units from art. 349_4 score 0.7947 against each other,
below the 0.85 rejection bar, and are distinct needles with distinct literals).

Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` (660 modules at pre-selection)
and `tq.build_tasks` for 地方税法 (38,410 tasks;
相続税法 2,775 tasks), and confirming verifiable kind,
empty `unhandled_conditions`, no UNRESOLVED unit, `clause_correspondence` True with basis
`spec numerals / rate ratio in clause`, unit text inside
`scoped_article_text(law, article, needles)`, coverage exact + unique ids, a
source path, SHA-256 pin, revision match, and verbatim law/revision/needle
presence in the article + paragraph of the raw JSON (one scoped hit). All five
units passed (`build/batch335_choose.out`, `MANDATORY_PREVALIDATION_ALL_OK True`;
`build/batch335_final_prevalidation.out`, `MANDATORY_PREVALIDATION_ALL_OK True`).
The generated Spec.lean files were re-checked so that statutory literals live
only inside `def specInScope` before the first `theorem ` marker, with an
independent formula (no implementation identifier), a universal axiom-free
bridge, a Decidable Bool mirror, and 5 distinct kernel-decided boundary
categories in every module. Units are genuine numeric thresholds, never
numeral-only matches; each has one spec literal >= 2 attached to its marker.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」/「超え」 are STRICT. No statutory
literal 1 is used as a threshold value in any spec (single spec literals:
6000, 35000, 10000000, 10000000, 9500000). The single-literal `百分のN` rule does not
apply to any of these units. All boundary examples are kernel-decided
(`by unfold ...; decide`, `by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax349_4PopulationOver6000Inclusive.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 六千人以上 (population >= 6000) INCLUSIVE lower bound in the 人口五千人以上一万人未満の市町村 amount-calculation branch of the 大規模の償却資産 table in 地方税法 art. 349_4(1). The 六千人未満 upper branch, the 五億四千四百万円 base, the 人口千人を増すごとに四千四百万円 formula, the other municipality brackets and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2628 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 349_4, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:349_4/Article#349_4/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`.

- Normative unit `NORM|33deb9b0beadda5cf0073daba40d497bbb4787eb919f359d92efd23201ad4ef3` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「人口六千人未満の場合には五億四千四百万円、人口六千人以上の場合には五億四千四百万円に人口五千人から計算して人口千人を増すごとに四千四百万円を加算した額」;
  ONLY the 六千人以上 (population >= 6000) INCLUSIVE lower bound in the 人口五千人以上一万人未満の市町村 amount-calculation branch of the 大規模の償却資産 table in 地方税法 art. 349_4(1). The 六千人未満 upper branch, the 五億四千四百万円 base, the 人口千人を増すごとに四千四百万円 formula, the other municipality brackets and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input), inScopeBool 5_999 = false (threshold_below), inScopeBool 6_000 = true (threshold_at (inclusive)), inScopeBool 6_001 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 6_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「六千人以上」 is INCLUSIVE (threshold itself qualifies).

### LocalTax349_4PopulationOver35000Inclusive.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 三万五千人以上 (population >= 35000) INCLUSIVE lower bound in the 人口三万人以上二十万人未満の市町村 amount-calculation branch of the 大規模の償却資産 table in 地方税法 art. 349_4(1). The 三万五千人未満 upper branch, the 十二億八千万円 base, the 人口五千人を増すごとに八千万円 formula, the other municipality brackets and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2628 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 349_4, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:349_4/Article#349_4/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`.

- Normative unit `NORM|2adf43017931262e963d1579247b8ddd6a3420f27e553c2c3df2dd85dd35cd7c` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「人口三万五千人未満の場合には十二億八千万円、人口三万五千人以上の場合には十二億八千万円に人口三万人から計算して人口五千人を増すごとに八千万円を加算した額」;
  ONLY the 三万五千人以上 (population >= 35000) INCLUSIVE lower bound in the 人口三万人以上二十万人未満の市町村 amount-calculation branch of the 大規模の償却資産 table in 地方税法 art. 349_4(1). The 三万五千人未満 upper branch, the 十二億八千万円 base, the 人口五千人を増すごとに八千万円 formula, the other municipality brackets and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input), inScopeBool 34_999 = false (threshold_below), inScopeBool 35_000 = true (threshold_at (inclusive)), inScopeBool 35_001 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 35_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「三万五千人以上」 is INCLUSIVE (threshold itself qualifies).

### LocalTax72_95EvadedAmountOver10MStrict.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 千万円を超える (yen > 10000000) STRICT excess of the evaded/refunded 譲渡割 amount that triggers the enhanced fine in 地方税法 art. 72_95(3). The 情状により discretionary fine reduction, the 第一項の各項の罰金 base amounts, the 未遂 provisions and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2628 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 72_95, paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_95/Article#72_95/Paragraph#3/ParagraphSentence/Sentence#1`.

- Normative unit `NORM|7e980af5d2aff767f9b6996a7365c3f48b8935f2111484dc896ddfdc9df46bf3` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「第一項第一号の免れた税額若しくは同項第二号の還付を受けた金額又は前項の犯罪に係る還付を受けようとした金額が千万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、千万円を超える額でその免れた税額若しくは還付を受けた金額又は還付を受けようとした金額に相当する額以下の額とすることができる。」;
  ONLY the 千万円を超える (yen > 10000000) STRICT excess of the evaded/refunded 譲渡割 amount that triggers the enhanced fine in 地方税法 art. 72_95(3). The 情状により discretionary fine reduction, the 第一項の各項の罰金 base amounts, the 未遂 provisions and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = false (zero), inScopeBool 1 = false (small_input), inScopeBool 9_999_999 = false (threshold_below), inScopeBool 10_000_000 = false (threshold_at (exclusive)), inScopeBool 10_000_001 = true (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 10_000_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「千万円を超える」 is STRICT (threshold itself does NOT qualify).

### LocalTax312Capital10MEmployeesUpTo50Inclusive.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 千万円以下 (capital <= 10000000) INCLUSIVE capital ceiling for a 法人 with 五十人以下の従業者数 in ホ of the 均等割 table in 地方税法 art. 312(1). The 五十人以下 employee condition, the 五万円 rate, the other capital/employee brackets and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2628 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 312, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:312/Article#312/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#6`.

- Normative unit `NORM|a293a9321c21dd49dcd342ec4aa2e6e2cf2e853b34f4443eb3ffd890c78d93b3` (kind EXCEPTION); dependency-free and `NOT_STARTED`.

- Needle 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもののうち、市町村内に有する事務所、事業所又は寮等の従業者（政令で定める役員を含む。）の数の合計数（次号から第九号まで及び第五項において「従業者数の合計数」という。）が五十人以下のもの」;
  ONLY the 千万円以下 (capital <= 10000000) INCLUSIVE capital ceiling for a 法人 with 五十人以下の従業者数 in ホ of the 均等割 table in 地方税法 art. 312(1). The 五十人以下 employee condition, the 五万円 rate, the other capital/employee brackets and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), inScopeBool 1 = true (small_input), inScopeBool 9_999_999 = true (threshold_below), inScopeBool 10_000_000 = true (threshold_at (inclusive)), inScopeBool 10_000_001 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 10_000_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「千万円以下」 is INCLUSIVE (threshold itself qualifies).

### LocalTax37ElderSpouseIncomeUpTo9500000Inclusive.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- H/T/D/C/U: H（ONLY the 九百五十万円以下 (income <= 9500000) INCLUSIVE ceiling of the reduced 調整控除 branch for 老人控除対象配偶者 in 地方税法 art. 37(1) item (6)(ii). The 九百万円を超える lower bound, the 九百五十万円を超え千万円以下 next bracket, the 十万円/六万円/三万円 deduction amounts and 他項他条項 are NOT MODELLED.）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2628 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（当該条文の他の数値・算定式・他項他条項は非介入）,
  U（人間の法的レビューなし、当該期間の法的評価・他条項は未判定）。

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`, SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article Num 37, paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:37/Article#37/Paragraph#1/Item#1/Subitem1#1/TableStruct/Table/TableRow/TableColumn/Sentence#2`.

- Normative unit `NORM|025a90513e240acd0592bbbc157f613885384ffe85942baec68dc76520fed7c9` (kind CONDITION); dependency-free and `NOT_STARTED`.

- Needle 「（ｉｉ）　当該控除対象配偶者が老人控除対象配偶者である場合　十万円（当該納税義務者の前年の合計所得金額が九百万円を超え九百五十万円以下である場合には六万円、当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合には三万円）」;
  ONLY the 九百五十万円以下 (income <= 9500000) INCLUSIVE ceiling of the reduced 調整控除 branch for 老人控除対象配偶者 in 地方税法 art. 37(1) item (6)(ii). The 九百万円を超える lower bound, the 九百五十万円を超え千万円以下 next bracket, the 十万円/六万円/三万円 deduction amounts and 他項他条項 are NOT MODELLED. The needle is verbatim and unique in the pinned article + paragraph
  of the raw snapshot (one scoped hit). Scope verification was scoped to the
  article + paragraph of the source path, not to the whole law text.

- Boundaries: inScopeBool 0 = true (zero), inScopeBool 1 = true (small_input), inScopeBool 9_499_999 = true (threshold_below), inScopeBool 9_500_000 = true (threshold_at (inclusive)), inScopeBool 9_500_001 = false (threshold_above) — 5 distinct categories, all kernel-decided.

- Independent spec states the boundary from statutory literals only
  (single literal 9_500_000, no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`. Statutory literals live only in `def specInScope` before
  the first `theorem ` marker. 「九百五十万円以下」 is INCLUSIVE (threshold itself qualifies).

