# Adversarial review — batch 313

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned e-Gov snapshot of 地方税法
(law 325AC0000000226, revision `325AC0000000226_20261101_508AC0000000002`).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (candidates cached
under gitignored `build/batch313_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path traversing
MainProvision only (no 附則), short scoped text (<300 chars), and a threshold
marker (以上 / 以下 / 超え / 以内 / をこえる). The single mmap pass yielded 372
candidates; 7 carried a single kanji numeral >= 2 directly attached to that
marker. Five shortlisted candidates were rejected at selection and REPLACED:
地方税法 art. 34 「三万二千円以下」, 地方税法 art. 154 「二トン以下」, 相続税法
art. 21_9 「十八歳以上」, 相続税法 art. 66_2 「二分の一を超える」 and 地方税法
art. 768 「六人以上十二人以内」 all had competing thresholds, a statutory
literal 1, or a fractional/rate numeral; every one still passed the mechanical
generator clause gate but was excluded by the single-threshold rule. Existing
`JapanTaxLaw/*.lean`, the transcription checks,
`data/TRANSCRIPTION_CHECK_REGISTRY.json` and the durable transcription pins were
searched first; none of these five units was previously modelled (no verbatim
needle and no same-article/same-phrase unit). Each candidate was then
pre-validated twice by importing
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
(8 here, 7 for the short art. 321_15 case) covering >= 3 distinct boundary
categories (5 here). 「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」/「をこえる」
are STRICT. No statutory literal 1 is used as a threshold value in any spec
(single spec literals: 10, 5, 65, 10000000, 2). The single-literal `百分のN`
ceiling/floor is used only where N/100 is exactly the clause rate (none of
these five units uses one). All boundary examples are kernel-decided
(`by unfold …; decide`, `by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax84GolfTicketReturnWithin10Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第八十四条 (Num 84), paragraph 5 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:84/Article#84/Paragraph#5/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|534bd4b572f7d360697e535aed1d75e99908ce40d2fa2981e8ec148a799540bf` (kind CONDITION).
- Needle 「第二項の証票の交付を受けた者は、当該ゴルフ場に係るゴルフ場利用税の特別徴収の義務が消滅した場合においては、その消滅した日から十日以内にその証票を道府県知事に返さなければならない。」;
  十日以内 is INCLUSIVE (`≤`), so 10 is inside and 11 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 9 = true` (threshold_below), `inScopeBool 10 = true` (threshold_at (inclusive)), `inScopeBool 11 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `days <= 10` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第八十四条(5)の特別徴収義務消滅後十日以内に証票を返す場合の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2463 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第二項の証票交付手続・特別徴収義務の発生・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax603CollectionDeferralWithin5Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第六百三条 (Num 603), paragraph 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:603/Article#603/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|2f54baade3b1536a963886b5ee761456894f741158f39c87934ccb9785745a9f` (kind DELEGATION).
- Needle 「市町村長は、土地の所有者等から前二項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該土地の取得の日から五年以内で政令で定める期間を限つて、当該土地に係る特別土地保有税に係る地方団体の徴収金の徴収を猶予するものとする。」;
  五年以内 is INCLUSIVE (`≤`), so 5 is inside and 6 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 4 = true` (threshold_below), `inScopeBool 5 = true` (threshold_at (inclusive)), `inScopeBool 6 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `years <= 5` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第六百三条(3)の土地取得日から五年以内で徴収を猶予する期間の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2463 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（政令で定める期間・申告の真実性判定・前二項・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax701_31ElderAge65OrMore.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百一条の三十一 (Num 701_31), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:701_31/Article#701_31/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|f964cee74f1d40f1393cb701913d4bcfe7e8fc59083404ed4297b4b121b05734` (kind CONDITION).
- Needle 「前項第五号の場合において、障害者、年齢六十五歳以上の者又は雇用改善助成対象者であるかどうかの判定は、その者に対して給与等が支払われる時の現況によるものとする。」;
  六十五歳以上 is INCLUSIVE (`≥`), so 65 is inside and 64 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 64 = false` (threshold_below), `inScopeBool 65 = true` (threshold_at (inclusive)), `inScopeBool 66 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `65 <= age` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七百一条の三十一(2)の現況判定における年齢六十五歳以上の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2463 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（障害者・雇用改善助成対象者の判定・前項第五号・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax52CapitalUpTo10M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第五十二条 (Num 52), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:52/Article#52/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#6`.
- Normative unit `NORM|018f9cb69c1cc3f231a5e164da145f480f1456d005c3f5b095281308d5ffdd74` (kind EXCEPTION).
- Needle 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもの」;
  千万円以下 is INCLUSIVE (`≤`), so 10000000 is inside and 10000001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 9999999 = true` (threshold_below), `inScopeBool 10000000 = true` (threshold_at (inclusive)), `inScopeBool 10000001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `amount <= 10000000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第五十二条(1)の資本金等の額が千万円以下である法人の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2463 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（別表第二の独立行政法人・ニに掲げる法人の除外・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax321_15TwoOrMorePrefectures.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百二十一条の十五 (Num 321_15), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:321_15/Article#321_15/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|1fc2ab63bbf4a1b5e319927bae738c1d86adb78a16951d2135a3e09224f7ba8c` (kind REFERENCE).
- Needle 「前条第六項の通知に係る同条第一項の市町村長の処分に不服がある関係市町村長は、道府県知事（関係市町村が二以上の道府県に係るときは、総務大臣）に対し、決定を求める旨を申し出ることができる。」;
  二以上 is INCLUSIVE (`≥`), so 2 is inside and 1 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input / threshold_below), `inScopeBool 2 = true` (threshold_at (inclusive)), `inScopeBool 3 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at (inclusive), threshold_above (5 distinct categories,
  all kernel-decided).
- Independent spec states the bound as `2 <= prefectures` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三百二十一条の十五(1)の関係市町村が二以上の道府県に係る場合の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2463 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前条第六項の通知・第一項の処分・不服申立て手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation, task-state, progress or queue file was written by this review.
- `generate_umbrella.py` wrote 2460 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2463 jobs, exit 0);
  all 15 modules (impl + Spec + Tests) kernel-built green.
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 775/775 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
