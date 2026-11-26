# Adversarial review — batch 251

MECHANICAL, NOT HUMAN. This document records a mechanical (not human)
independent re-extraction of five dependency-free single-threshold normative
units from the pinned 相続税法 / 地方税法 snapshots. No human legal approval is
recorded here; every unit remains `LEGAL_REVIEW_PENDING`. No human reviewer has
read or approved these units.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim (after whitespace normalisation) against the
pinned raw snapshots. Articles and needles were checked against the existing
`JapanTaxLaw/*.lean` names and the transcription checks /
`TRANSCRIPTION_CHECK_REGISTRY.json` before selection; all five units are
`NOT_STARTED`, dependency-free, and none of their needles was previously
modelled. 「以上」 and 「以下」 are INCLUSIVE; 「を超え」 is STRICT; and
「〜を超えることができない」 is an INCLUSIVE ceiling (may not exceed, i.e. ≤).
Every boundary below is decided by the kernel, not asserted by prose.

### LocalTax154LoadOver8Tons.lean — 最大積載量 八トン超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百五十四条 (Num 154).
- Normative unit
  `NORM|6cbc1d048de06a8f6ab32c0a1f99482b5d2576669a8a1659176fa69cc7d02d5e`.
- Needle 「（９）　最大積載量が八トンを超えるもの」;
  八 = 8 tons, 「を超え」 is STRICT (`>`), so 8 does NOT trigger and 9 does.
  This is deliberately the strict companion to the previously modelled
  inclusive 「八トン以下のもの」 in the SAME article.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `7 = false` (below),
  `8 = false` (at — strict), `9 = true` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `8 < amount` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（最大積載量 八トン超）, T（八、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（自動車区分・税率・他の行／条項は非介入）.

### LocalTax321_13TwoMunicipalities.lean — 市町村民税 二以上の市町村

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百二十一条の十三 (Num 321_13).
- Normative unit
  `NORM|0e932ec0fb941e86071a8901c857ebbebb1b85e67158a821fb23df425736697a`.
- Needle 「（二以上の市町村において事務所又は事業所を有する法人の市町村民税の申告納付）」;
  二 = 2 municipalities, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories over 4 distinct inputs).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（市町村民税 二以上の市町村）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（申告納付手続・税率・他の条項は非介入）.

### LocalTax314_2PensionOver7Man.lean — 旧個人年金保険料 七万円超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百十四条の二 (Num 314_2).
- Normative unit
  `NORM|1875dd112ec59bcf491bcdcd894154883735c5c688a809cf94606b660eae38ea`.
- Needle 「前年中に支払つた旧個人年金保険料の金額の合計額が七万円を超える場合」;
  七 = 7 (万円 units), 「を超え」 is STRICT (`>`), so 7 does NOT trigger and 8
  does.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `6 = false` (below),
  `7 = false` (at — strict), `8 = true` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `7 < amount` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（旧個人年金保険料 七万円超）, T（七、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（控除額の算定・他の号／条項は非介入）.

### InheritanceTax68PenaltyTo10Years.lean — 脱税 十年以下の拘禁刑

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000073` (相続税法), revision
  `325AC0000000073_20260401_506AC0000000008`, raw snapshot
  `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第六十八条 (Num 68).
- Normative unit
  `NORM|9c96df33df6ab42700ee58457b625d2737323864193a9237a2f616c5c9543fe6`.
- Needle 「偽りその他不正の行為により相続税又は贈与税を免れた者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」;
  十 = 10 years, 「以下」 is INCLUSIVE (`≤`), so 10 qualifies and 11 does not.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `9 = true` (below),
  `10 = true` (at), `11 = false` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≤ 10` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（脱税 十年以下の拘禁刑）, T（十、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（罰金額・併科・他の条項は非介入）.

### LocalTax72_38_2DeferralCeiling6Years.lean — 徴収猶予期間 六年を超えることができない

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の三十八の二 (Num 72_38_2).
- Normative unit
  `NORM|ce6757b91f05f96d9968e5b5bf66b3d800df83c4d9716bb6c8bab220fc6c9bd9`.
- Needle 「ただし、その期間は、既に当該法人につき同項の規定により徴収を猶予した期間と合わせて六年を超えることができない。」;
  六 = 6 years, 「〜を超えることができない」 is an INCLUSIVE ceiling (`≤`), so
  6 qualifies and 7 does not. This is deliberately the ceiling analogue of the
  strict 「を超え」 units above.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `5 = true` (below),
  `6 = true` (at), `7 = false` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≤ 6` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（徴収猶予期間 六年を超えることができない）, T（六、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（猶予期間の算定・対象税額・他の項／条項は非介入）.

## Status

All five reviews are MECHANICAL, NOT HUMAN. They are produced by deterministic
source re-extraction and kernel boundary decisions, not by a human legal
reviewer. Human legal review remains `LEGAL_REVIEW_PENDING`; no approval is
fabricated or recorded here.
