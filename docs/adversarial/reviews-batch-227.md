# Adversarial review — batch 227

Mechanical (not human) independent re-extraction of six threshold/tier units.
No human legal approval is recorded here. Each section is module-specific.

### LocalTax37_2Over40M.lean — 地方税法 第三十七条の二(11)

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`;
  raw `data/raw/325AC0000000226_20261101_508AC0000000002.law.json` SHA-256
  `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Normative unit `NORM|816a9b3ed494c525f1b3970bb086dc444def10430a0483525f23f6c845f93a6c`.
- Needle 「四千万円を超える金額」 verbatim in scoped table cell; literal
  40,000,000 = 四千万. 「を超え」 strict: 40,000,000 excluded, 40,000,001 included.
- Independent successor-form spec, universal axiom-free bridge, kernel
  boundary cases zero/small/just-below/at/just-above.
- H/T/D/C/U: H（4000万超）, T（四千万、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他区分・他項は非介入）.

### InheritanceTaxRateUpTo10M.lean — 相続税法 第十六条(1)

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000073`, revision `325AC0000000073_20260401_506AC0000000008`;
  raw SHA-256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.
- Normative unit `NORM|92331abb47f0b9bba69651babb5e33741e72a9f527d842c4cd3de6ad1734abee`.
- Needle 「千万円以下の金額」 verbatim in scoped cell; 10,000,000 = 千万;
  「以下」 inclusive: 10,000,000 qualifies, 10,000,001 does not.
- Independent spec `amount <= 10000000`, universal `rfl` bridge, kernel boundaries.
- H/T/D/C/U: H（1000万以下）, T（千万、bytes pinned）, D（rfl/decide）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他区分・他項は非介入）.

### InheritanceTaxRateOver600M.lean — 相続税法 第十六条(1)

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Same law/revision/pin as the preceding 相続税法 unit.
- Normative unit `NORM|b499e7ff816c3143182331132a1f1511d6e34881154b571c773d19feb4834159`.
- Needle 「六億円を超える金額」 verbatim; 600,000,000 = 六億; strict lower.
- Independent successor-form spec, universal bridge, kernel boundary cases.
- H/T/D/C/U: H（6億超）, T（六億、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他区分・他項は非介入）.

### InheritanceGiftRateOver30M.lean — 相続税法 第二十一条の七(1)

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Same law/revision/pin; normative unit
  `NORM|7e19c12b92a5778bd5316fcf9548271de5a3256091b2addd3f1ec59619e759df`.
- Needle 「三千万円を超える金額」 verbatim; 30,000,000 = 三千万; strict lower.
- Independent successor-form spec, universal bridge, kernel boundary cases.
- H/T/D/C/U: H（3000万超）, T（三千万、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他区分・他項は非介入）.

### InheritanceGiftRateUpTo2M.lean — 相続税法 第二十一条の七(1)

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Same law/revision/pin; normative unit
  `NORM|c15d9fc007f9f3839fac4e9af8b4c4b0e8625df3c89ac6a180ca7fe82d66a49b`.
- Needle 「二百万円以下の金額」 verbatim; 2,000,000 = 二百万; inclusive upper.
- Independent spec `amount <= 2000000`, universal `rfl` bridge, kernel boundaries.
- H/T/D/C/U: H（200万以下）, T（二百万、bytes pinned）, D（rfl/decide）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他区分・他項は非介入）.

### LocalTax71_14MidTier.lean — 地方税法 第七十一条の十四

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision/pin as above; normative unit
  `NORM|23f1875b99e1ca9530b8448cc0bde166becab06b599c9fc71510b967df026cb4`.
- Needle 「五十万円を超え三百万円以下の部分に相当する金額」 verbatim in the
  scoped clause; literals 500,000 = 五十万 and 3,000,000 = 三百万.
- Scope is ONLY the tier interval (500,000, 3,000,000]; the "部分に相当する金額"
  computation itself, the tax rate and other tiers are NOT MODELLED.
- Independent successor-form spec, universal bridge, kernel boundary cases.
- H/T/D/C/U: H（50万超300万以下の区分）, T（両境界、bytes pinned）,
  D（普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（相当金額の算出・税率・他区分は非介入）.

## Status

All six reviews are mechanical, not human. Human legal review remains
`LEGAL_REVIEW_PENDING`; no approval is recorded.
