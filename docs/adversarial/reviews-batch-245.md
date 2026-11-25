# Adversarial review — batch 245

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold CONDITION units from the pinned 地方税法 snapshot. No human
legal approval is recorded here; every unit remains `LEGAL_REVIEW_PENDING`.

Common pin for all five sections: law `325AC0000000226` (地方税法), revision
`325AC0000000226_20261101_508AC0000000002`, raw snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
SHA-256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
The needles below were re-extracted independently from the primary source
(一次資料) and matched byte-for-byte after whitespace normalisation.

### LocalTax154DisplacementOver6L.lean — 総排気量 六リットル超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百五十四条 (Num 154).
- Normative unit `NORM|01d4d7b447399c3a29c8b45e6671e7eaec473d25acd4b773304c174dcdc954aa`.
- Needle 「総排気量が六リットルを超えるもの」; 六 = 6 litres, 「を超え」 is
  STRICT (`>`), so 6 does not trigger and 7 does.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (5), `threshold_at` (6), `threshold_above` (7).
- Independent spec rewrites the trigger as `amount > 6` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（総排気量6リットル超）, T（六、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（車両区分の他の欄・税率は非介入）.

### LocalTax154PassengersUpTo30.lean — 乗車定員 三十人以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百五十四条 (Num 154).
- Normative unit `NORM|19e6a008bafcbf28089826a4191debb49496177793c74d5e3ff0b55f41d2635a`.
- Needle 「乗車定員が三十人以下のもの」; 三十 = 30 passengers, 「以下」 is
  INCLUSIVE (`≤`), so 30 triggers and 31 does not.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (29), `threshold_at` (30), `threshold_above` (31).
- Independent spec rewrites the trigger as `amount ≤ 30` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（乗車定員30人以下）, T（三十、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（車両区分の他の欄・税率は非介入）.

### LocalTax349Population200k.lean — 人口 二十万人以上

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百四十九条の四 (Num 349_4).
- Normative unit `NORM|13392f81030b448f210599b96a54470f54cc058f859d69754d2e3f4554d73fa8`.
- Needle 「人口二十万人以上の市」; 二十万 = 200,000, 「以上」 is INCLUSIVE
  (`≥`), so 199,999 does not trigger and 200,000 does.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (199,999), `threshold_at` (200,000),
  `threshold_above` (200,001).
- Independent spec rewrites the trigger as `amount ≥ 200000` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（人口20万人以上）, T（二十万、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（市の指定手続・他の区分は非介入）.

### LocalTax423CommitteeMin3.lean — 委員定数 三人以上

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四百二十三条 (Num 423).
- Normative unit `NORM|788a46ffcd4f2317b2a1716797a350bd3f5fdd48f4ea5f3b4322b3b266243f3a`.
- Needle 「固定資産評価審査委員会の委員の定数は三人以上とし、当該市町村の条例で定める。」;
  三 = 3 members, 「以上」 is INCLUSIVE (`≥`), so 2 does not satisfy the
  statutory floor and 3 does.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (2), `threshold_at` (3), `threshold_above` (4).
- Independent spec rewrites the trigger as `amount ≥ 3` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（委員定数3人以上）, T（三、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（条例による具体定数・委員の資格は非介入）.

### LocalTax448FourWheelUp.lean — 四輪以上

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四百四十八条 (Num 448).
- Normative unit `NORM|0abae19216f13a5942f23c3c0b706387685b8125ed0e00702643f827a91e6617`.
- Needle 「四輪以上のもの」; 四 = 4 wheels, 「以上」 is INCLUSIVE (`≥`),
  so 3 does not trigger and 4 does.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (3), `threshold_at` (4), `threshold_above` (5).
- Independent spec rewrites the trigger as `amount ≥ 4` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（四輪以上）, T（四、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（車両区分の他の欄・税率は非介入）.

## Status

All five reviews are mechanical, not human. Human legal review remains
`LEGAL_REVIEW_PENDING`; no approval is recorded.
