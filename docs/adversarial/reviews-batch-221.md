# Adversarial review — batch 221

Mechanical (not human) independent re-extraction and cross-check of six
dependency-free 地方税法 第三十七条の二(11) taxable-income bands. Every claim
below is reproducible from committed bytes. No human legal approval is recorded.

## Shared pin

- 一次資料: 地方税法 (law id `325AC0000000226`), revision
  `325AC0000000226_20261101_508AC0000000002`
- Source: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
- SHA-256: `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`
  (independently recomputed, 照合 OK)
- Each needle is found verbatim in the scoped table cell of Article 第三十七条の二
  Paragraph 11, not merely somewhere in the whole law.

### LocalTax37_2BandUpTo195.lean — 百九十五万円以下の金額

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit: `NORM|a63c51497da33723c05f89264def18ad7c274d4d926f1bfe4267b570026f62f4`
- Literal 1,950,000 = 百九十五万 verbatim; 「以下」 inclusive (0..1,950,000).
- Independent spec `amount <= 1950000` uses no impl identifier; universal
  `rfl` bridge; zero/small/at/just-above boundary cases kernel-decided.
- H/T/D/C/U: H（課税所得金額 195万以下）, T（百九十五万、bytes pinned）,
  D（`rfl`/`by decide`）, C（needle scoped, 境界完整, spec 独立）,
  U（税率・他区分・控除・他項は非介入）.

### LocalTax37_2Band195To330.lean — 百九十五万円超三百三十万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit: `NORM|2808f92c80b1dca3aac8145ac33c4423fd38d05ee8648ebd33d9a11e877c114d`
- Interval (1,950,000, 3,300,000]; literals 百九十五万 / 三百三十万 verbatim.
- Independent successor-form spec; universal axiom-free bridge; boundary
  categories zero/small/just-below/at/just-above/upper kernel-decided.
- H/T/D/C/U: H（195万超330万以下）, T（両境界、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（税率・他区分・控除・他項は非介入）.

### LocalTax37_2Band330To695.lean — 三百三十万円超六百九十五万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit: `NORM|bc18b6c4f3f85534692748df2597633991ed645a400026aebfb1aea576126ca3`
- Interval (3,300,000, 6,950,000]; literals 三百三十万 / 六百九十五万 verbatim.
- Same independent-spec and boundary structure as above; universal bridge.
- H/T/D/C/U: H（330万超695万以下）, T（両境界、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（税率・他区分・控除・他項は非介入）.

### LocalTax37_2Band695To900.lean — 六百九十五万円超九百万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit: `NORM|97c4daa450498330a9237448704c4ce49d3b816d053b5b70bfca92ac1288972c`
- Interval (6,950,000, 9,000,000]; literals 六百九十五万 / 九百万 verbatim.
- Same independent-spec and boundary structure; universal bridge.
- H/T/D/C/U: H（695万超900万以下）, T（両境界、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（税率・他区分・控除・他項は非介入）.

### LocalTax37_2Band900To1800.lean — 九百万円超千八百万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit: `NORM|c9934e9ea57c62899dce39e90bacdc679abf8fad7250d364ef4ca8a1f95a3917`
- Interval (9,000,000, 18,000,000]; literals 九百万 / 千八百万 verbatim.
- Same independent-spec and boundary structure; universal bridge.
- H/T/D/C/U: H（900万超1800万以下）, T（両境界、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（税率・他区分・控除・他項は非介入）.

### LocalTax37_2Band1800To4000.lean — 千八百万円超四千万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- Normative unit: `NORM|5811f3c7e167317de6a2a2f42fa756fe80d1a312f06f8e5b088b730006a0d0a4`
- Interval (18,000,000, 40,000,000]; literals 千八百万 / 四千万 verbatim.
- Same independent-spec and boundary structure; universal bridge.
- H/T/D/C/U: H（1800万超4000万以下）, T（両境界、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（税率・他区分・控除・他項は非介入）.

## Status

All six reviews are mechanical, not human. Human legal review remains a
separate `LEGAL_REVIEW_PENDING` axis; nothing here records an approval.
