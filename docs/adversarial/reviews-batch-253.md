# Adversarial review — batch 253

MECHANICAL, NOT HUMAN. This document records a mechanical (not human)
independent re-extraction of five dependency-free single-threshold normative
units from the pinned 地方税法 snapshot. No human legal approval is recorded
here; every unit remains `LEGAL_REVIEW_PENDING`. No human reviewer has read or
approved these units.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim (after whitespace normalisation) against the
pinned raw snapshot. Articles and needles were checked against the existing
`JapanTaxLaw/*.lean` names and the transcription checks /
`TRANSCRIPTION_CHECK_REGISTRY.json` before selection; all five units are
`NOT_STARTED`, dependency-free, and none of their needles was previously
modelled. 「以上」 is INCLUSIVE; 「を超え」 is STRICT; and
「〜を超えることができない」 is an INCLUSIVE ceiling (may not exceed, i.e. ≤).
Every boundary below is decided by the kernel, not asserted by prose.

### LocalTax57TwoPrefecturesResidentsTax.lean — 道府県民税 二以上の道府県

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第五十七条 (Num 57).
- Normative unit
  `NORM|c33aed21809089961919681561d7b6f5f336d92ba115de0dcef799bb5cbed752`.
- Needle 「（二以上の道府県において事務所又は事業所を有する法人の道府県民税の申告納付）」;
  二 = 2 prefectures, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it. The 市町村 counterpart (art. 321_13) was modelled in a
  previous batch; this 道府県 headline is a distinct, previously unmodelled unit.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories over 4 distinct inputs).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（道府県民税 二以上の道府県）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（申告納付手続・税率・他の条項は非介入）.

### LocalTax34TenYearsInsurancePayments.lean — 年金支払開始日前 十年以上の払込み

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三十四条 (Num 34).
- Normative unit
  `NORM|6b39d2ffd783c701be469af1874187be43b3dfbf3fc741e88ac530e7cb3e3bb2`.
- Needle 「当該契約に基づく保険料又は掛金の払込みは、年金支払開始日前十年以上の期間にわたつて定期に行うものであること。」;
  十 = 10 years, 「以上」 is INCLUSIVE (`≥`), so 9 is below the floor
  and 10 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `9 = false` (below),
  `10 = true` (at), `11 = true` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 10` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（旧個人年金保険料 十年以上の払込み）, T（十、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（控除額の算定・他の号／条項は非介入）.

### LocalTax72_25Over4Months.lean — 指定月数 四月を超える

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の二十五 (Num 72_25).
- Normative unit
  `NORM|debb666d030002ace27d83b2391038f119f9fbc12e99315be413189f63c7a4b6`.
- Needle 「当該道府県知事が指定する四月を超える月数の期間内」;
  四 = 4 months, 「を超え」 is STRICT (`>`), so 4 does NOT trigger and 5 does.
  This is deliberately the distinct 四月 companion to the previously modelled
  三月超 unit in the SAME article (a different literal, not a duplicate).
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `3 = false` (below),
  `4 = false` (at — strict), `5 = true` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `4 < amount` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（中間申告 四月超の月数）, T（四、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（指定月数の算定・他の号／条項は非介入）.

### LocalTax321_14TwoMunicipalitiesEmployeeCount.lean — 法人税額分割 二以上の市町村

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百二十一条の十四 (Num 321_14).
- Normative unit
  `NORM|3a9c0ba8856d5d1683d8da5e761646945ab14c255426a5f102c4a6fcc639bd4c`.
- Needle 「（二以上の市町村において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」;
  二 = 2 municipalities, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories over 4 distinct inputs).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（法人税額分割 二以上の市町村）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（分割基準・従業者数算定・他の条項は非介入）.

### LocalTax58TwoPrefecturesEmployeeCount.lean — 法人税額分割 二以上の道府県

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第五十八条 (Num 58).
- Normative unit
  `NORM|94068b8d4435bc2cb64a3d6b7fe3f1bf1ae1c76f8d7a8362a2a519e474bfd1aa`.
- Needle 「（二以上の道府県において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」;
  二 = 2 prefectures, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it. This is the 道府県 counterpart of art. 321_14 (市町村),
  a distinct article and previously unmodelled unit.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories over 4 distinct inputs).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（法人税額分割 二以上の道府県）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（分割基準・従業者数算定・他の条項は非介入）.

## Status

All five reviews are MECHANICAL, NOT HUMAN. They are produced by deterministic
source re-extraction and kernel boundary decisions, not by a human legal
reviewer. Human legal review remains `LEGAL_REVIEW_PENDING`; no approval is
fabricated or recorded here.
