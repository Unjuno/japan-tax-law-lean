# Adversarial review — batch 249

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold normative units from the pinned 相続税法 / 地方税法 snapshots.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched byte-for-byte after whitespace normalisation. Articles
and needles were checked against the existing `JapanTaxLaw/*.lean` names and
the transcription checks / `TRANSCRIPTION_CHECK_REGISTRY.json` before
selection; all five units are `NOT_STARTED`, dependency-free, and none of
their needles was previously modelled. 「以上」 and 「以下」 are INCLUSIVE;
「を超え」 is STRICT. The boundary examples below are kernel-decided, not
asserted by prose.

### InheritanceTaxArt21_11_2TwoGiftors.lean — 特定贈与者 二人以上

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000073` (相続税法), revision
  `325AC0000000073_20260401_506AC0000000008`, raw snapshot
  `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第二十一条の十一の二 (Num 21_11_2).
- Normative unit
  `NORM|ba4a9dc61d44dd9331f12254edf683c46c3244a3e5bf9287cddd00c498f6ea4d`.
- Needle 「前項の相続時精算課税適用者に係る特定贈与者が二人以上ある場合における各特定贈与者から贈与により取得した財産に係る課税価格から控除する金額の計算については、政令で定める。」;
  二 = 2 donors, 「以上」 is INCLUSIVE (`≥`), so 1 does not satisfy the floor
  and 2 does.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（特定贈与者 二人以上）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（政令で定める控除額の計算・他の号・他条項は非介入）.

### LocalTax72_2_2ThreePrefectures.lean — 固有法人 三以上の道府県

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の二の二 (Num 72_2_2).
- Normative unit
  `NORM|e4e15922c903fdf06a978817a3091a91ef98e41cfed4aea6b6b2d2e9acca29c7`.
- Needle 「受託法人及び三以上の道府県において事務所又は事業所を設けて事業を行う固有法人で」;
  三 = 3 prefectures, 「以上」 is INCLUSIVE (`≥`), so 2 is below the floor
  and 3 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `2 = false` (below),
  `3 = true` (at), `4 = true` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 3` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（固有法人 三以上の道府県）, T（三、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（法人課税信託の読み替え表・受託法人・他の号は非介入）.

### LocalTax72_54TwoPrefectures.lean — 個人の事業税 二以上の道府県

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の五十四 (Num 72_54).
- Normative unit
  `NORM|b5de580fc177ceb8c11693a4e8679737d943677370327dbfa752c7daae51ab94`.
- Needle 「二以上の道府県において事務所又は事業所を設けて事業を行う個人に課する事業税の課税標準とすべき所得の総額は、主たる事務所又は事業所所在地の道府県知事が決定しなければならない。」;
  二 = 2 prefectures, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（個人の事業税 二以上の道府県）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（所得総額の決定手続・税率・他の条項は非介入）.

### LocalTax154LoadUpTo8Tons.lean — 最大積載量 八トン以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百五十四条 (Num 154).
- Normative unit
  `NORM|e2bbd47326d18c5ecc8cda90f94e92d81011cdde5ebc8a7c0f084998ec119812`.
- Needle 「（ｉｉ）　普通自動車であるもので最大積載量が八トン以下のもの」;
  八 = 8 tons, 「以下」 is INCLUSIVE (`≤`), so 8 qualifies and 9 does not.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `7 = true` (below),
  `8 = true` (at), `9 = false` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≤ 8` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（最大積載量 八トン以下）, T（八、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（自動車区分・税率・他の行／条項は非介入）.

### LocalTax72_26FiscalYearOver6Months.lean — 事業年度の期間 六月超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision
  `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の二十六 (Num 72_26).
- Normative unit
  `NORM|f6d9c9524214966a2a1078a1745a41d7cc3b3429a602081dd743300e9bbe931c`.
- Needle 「（事業年度の期間が六月を超える法人等の中間申告納付）」;
  六 = 6 months, 「を超え」 is STRICT (`>`), so 6 does not trigger and 7 does.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `5 = false` (below),
  `6 = false` (at), `7 = true` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount > 6` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（事業年度の期間 六月超）, T（六、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（中間申告額の算定・納付期限・他の項／条項は非介入）.

## Status

All five reviews are mechanical, not human. Human legal review remains
`LEGAL_REVIEW_PENDING`; no approval is recorded.
