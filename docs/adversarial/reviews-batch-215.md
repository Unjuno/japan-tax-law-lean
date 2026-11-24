# Adversarial review — batch 215

Mechanical (not human) independent re-extraction and cross-check of five
dependency-free 相続税法 normative units. Every claim below is reproducible
from committed bytes. No human legal approval is recorded here.

## Shared pin

- 一次資料: 相続税法 (law id `325AC0000000073`), revision
  `325AC0000000073_20260401_506AC0000000008`
- Source: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
- SHA-256: `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`
  (independently recomputed, SHA-256 照合 OK)
- Each needle below was independently re-extracted from the scoped Article and
  found verbatim in the stated table cell / list column — not merely somewhere
  in the whole law text.

### InheritanceGiftTaxRateBracket3M4M.lean — 相続税法 第二十一条の七(1)

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Needle: 「三百万円を超え四百万円以下の金額」 (Paragraph 1, rate table cell).
- Statutory literals: 3,000,000 = 三百万; 4,000,000 = 四百万 — both verbatim.
- Normative unit: `NORM|ba11d2cd9757bba62e0170670bdbca61193022421bd60ba07507240125ccbaf1`
- Interval: `3_000_000 < amount ∧ amount ≤ 4_000_000` (を超え strict, 以下 inclusive).
- Independent spec uses successor form; universal axiom-free bridge. Finite
  boundary examples (zero/small/just-below/at/just-above/upper) do not replace
  the universal equivalence proof.
- 判定: H/T/D/C/U: H（贈与税税率表区分）, T（三百万/四百万、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（対応税率・他区分・控除・他条は非介入）. BY-DESIGN / CONFIRMED.

### InheritanceGiftTaxRateBracket6M10M.lean — 相続税法 第二十一条の七(1)

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Needle: 「六百万円を超え千万円以下の金額」 (Paragraph 1, rate table cell).
- Statutory literals: 6,000,000 = 六百万; 10,000,000 = 千万 — both verbatim.
- Normative unit: `NORM|8438fb053f6e98d98adc83fb213c6bb3cccbe3c8e510429fcaec4a7e1ed18d75`
- Interval: `6_000_000 < amount ∧ amount ≤ 10_000_000`.
- Independent spec + universal bridge + kernel boundary categories as above.
- 判定: H/T/D/C/U: H（贈与税税率表区分）, T（六百万/千万、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（対応税率・他区分・控除・他条は非介入）. BY-DESIGN / CONFIRMED.

### InheritanceTaxRateBracket10_30.lean — 相続税法 第十六条(1)

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Needle: 「千万円を超え三千万円以下の金額」 (Paragraph 1, rate table cell).
- Statutory literals: 10,000,000 = 千万; 30,000,000 = 三千万 — both verbatim.
- Normative unit: `NORM|93b274d3db7616b01bf8ebe8da32b6a1bb33b66ca5f224d32215cd1108b0c470`
- Interval: `10_000_000 < amount ∧ amount ≤ 30_000_000`.
- Independent spec + universal bridge + kernel boundary categories as above.
- 判定: H/T/D/C/U: H（相続税税率表区分）, T（千万/三千万、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（対応税率・他区分・控除・他条は非介入）. BY-DESIGN / CONFIRMED.

### InheritanceResidualPeriod10Years.lean — 相続税法 第二十三条

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Needle: 「残存期間が十年以下のもの」 (Paragraph 1, list column).
- Statutory literal: 10 = 十 — verbatim in the scoped clause.
- Normative unit: `NORM|d5a66ff1b06fc056fd9ac865c49e901671853629ac2e087f189151171a59dc39`
- Condition: `years ≤ 10` (以下 inclusive); 10 included, 11 excluded.
- Independent spec `years <= 10`, universal `rfl` bridge, kernel boundary
  categories zero / small / just-below / at / just-above.
- 判定: H/T/D/C/U: H（残存期間十年以下）, T（十、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（評価割合・他期間区分・他条は非介入）. BY-DESIGN / CONFIRMED.

### InheritanceTaxRateBracket30_50.lean — 相続税法 第十六条(1)（repair）

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Needle: 「三千万円を超え五千万円以下の金額」 (Paragraph 1, rate table cell),
  found verbatim in the scoped article of the shared pin above.
- Normative unit: `NORM|2f9abe1626f614eaab2879239d801935a2a1b8cdbc5dde1de4f9c5925696a72b`
- Defect repaired: the previous spec reused implementation identifiers
  (`lowerBoundYen`, `upperBoundYen`) and kept boundary theorems inside the spec
  module, so its `independent_spec` axis was false and its `+1` literals were
  being checked against 原文. The spec now writes its own statutory bounds,
  the universal bridge uses destructured names (no stray numerals), and the
  boundary examples live in the Tests module.
- Interval: `30_000_000 < x ∧ x ≤ 50_000_000`; statutory literals 三千万 /
  五千万 verbatim; zero/small/just-below/at/just-above/upper boundary cases
  kernel-decided; universal impl/spec equivalence axiom-free.
- 判定 H/T/D/C/U: H（相続税税率表区分）, T（三千万/五千万、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（対応税率・他区分・控除・他条は非介入）.

### InheritanceTaxRateBracket50_100.lean — 相続税法 第十六条(1)（repair/addition）

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Needle: 「五千万円を超え一億円以下の金額」 (art.16 Paragraph 1 rate-table
  cell), found verbatim in the scoped article of the shared pin above.
- Normative unit: `NORM|df94f143188b89690e03047e002c6a375e81d8d3c81f4313c1995b484310badc`
- This row was missing from the modelled art.16 table (30M–50M existed, the
  next modelled row was 100M–200M). It is a genuine dependency-free unit, not
  an identifier-sized padding candidate.
- Interval: `50_000_000 < x ∧ x ≤ 100_000_000`; literals 五千万 / 一億 verbatim;
  zero/small/just-below/at/just-above/upper boundary cases kernel-decided;
  universal impl/spec equivalence axiom-free.
- 判定 H/T/D/C/U: H（相続税税率表の欠落行）, T（五千万/一億、bytes pinned）,
  D（`rfl`/`by decide`/普遍 bridge）, C（needle scoped, 境界完整, spec 独立）,
  U（対応税率・他区分・控除・他条は非介入）.

## Status

All six reviews are mechanical, not human. Human legal review remains a
separate `LEGAL_REVIEW_PENDING` axis; nothing here records an approval.
