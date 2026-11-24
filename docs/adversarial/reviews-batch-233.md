# Adversarial review — batch 233

Mechanical (not human) independent re-extraction of six threshold/tier units.
No human legal approval is recorded here. Each section is module-specific.

### InheritanceGiftRate4M6M.lean — 相続税法 第二十一条の七(1)

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000073`, revision `325AC0000000073_20260401_506AC0000000008`,
  raw SHA-256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.
- Normative unit `NORM|246a67a42516a454e7df2f7fc108debef44b46afd4aef3c1dd5e5f0e08115c11`.
- Needle 「四百万円を超え六百万円以下の金額」 verbatim in the scoped rate-table
  cell; literals 四百万 / 六百万. Interval (4M, 6M]; 4M excluded, 6M included.
- Independent successor-form spec, universal axiom-free bridge, kernel
  boundaries zero/small/just-below/at/just-above/upper.
- H/T/D/C/U: H（400万超600万以下）, T（両境界、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他区分・他条は非介入）.

### LocalTax71_14UpTo500k.lean — 地方税法 第七十一条の十四

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  raw SHA-256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Normative unit `NORM|7d61638c8ae1bc009300375e9f58a7c5ca80224ddaaf05117f14f9774b62d419`.
- Needle 「五十万円以下の部分に相当する金額」 verbatim; 五十万 = 500,000;
  inclusive upper. The "部分に相当する金額" computation itself is NOT MODELLED.
- Independent spec `amount <= 500000`, universal `rfl` bridge, kernel boundaries.
- H/T/D/C/U: H（50万以下の区分）, T（五十万、bytes pinned）, D（rfl/decide）,
  C（needle scoped, 境界完整, spec 独立）, U（相当金額の算出・他区分は非介入）.

### LocalTax71_14Over3M.lean — 地方税法 第七十一条の十四

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Same law/revision/pin; normative unit
  `NORM|87d05338f85a8ae5280c7369006feb6ca85c6f03bda61f8ac75798a14b22bb3b`.
- Needle 「三百万円を超える部分に相当する金額」 verbatim; 三百万 = 3,000,000;
  strict lower. The computation is NOT MODELLED.
- Independent successor-form spec, universal bridge, kernel boundary cases.
- H/T/D/C/U: H（300万超の区分）, T（三百万、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（相当金額の算出・他区分は非介入）.

### LocalTax72_21UpTo100B.lean — 地方税法 第七十二条の二十一

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Same law/revision/pin; normative unit
  `NORM|b1a1b0979276977d4cf041c0a1477a3c9a238dd3ff47f25678fb371133d47491`.
- Needle 「千億円以下の金額」 verbatim; 千億 = 100,000,000,000; inclusive upper.
- Independent spec `amount <= 100000000000`, universal `rfl` bridge, boundaries.
- H/T/D/C/U: H（千億以下）, T（千億、bytes pinned）, D（rfl/decide）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他区分・他条は非介入）.

### LocalTax72_21Band100B500B.lean — 地方税法 第七十二条の二十一

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Same law/revision/pin; normative unit
  `NORM|0683b64b0396c0ed4c0367851f755225f971c5710c1aba5bc94c20b5772ec56c`.
- Needle 「千億円を超え五千億円以下の金額」 verbatim; 千億 / 五千億;
  interval (100B, 500B]; shared boundary owned by the lower cell.
- Independent successor-form spec, universal bridge, kernel boundary cases.
- H/T/D/C/U: H（千億超五千億以下）, T（両境界、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他区分・他条は非介入）.

### LocalTax37Over2M.lean — 地方税法 第三十七条

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Same law/revision/pin; normative unit
  `NORM|92faec2b1932766778a63dcb97b8d8c74d7a9fbc4c4eba57a3791ca8dfec8488`.
- Needle 「二百万円を超える場合」 verbatim; 二百万 = 2,000,000; strict lower.
- Independent successor-form spec, universal bridge, kernel boundary cases.
- H/T/D/C/U: H（200万超）, T（二百万、bytes pinned）, D（普遍 bridge）,
  C（needle scoped, 境界完整, spec 独立）, U（税率・他条は非介入）.

## Status

All six reviews are mechanical, not human. Human legal review remains
`LEGAL_REVIEW_PENDING`; no approval is recorded.
