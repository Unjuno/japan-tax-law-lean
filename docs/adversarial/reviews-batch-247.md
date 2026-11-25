# Adversarial review — batch 247

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold CONDITION units from the pinned 地方税法 snapshot. No human
legal approval is recorded here; every unit remains `LEGAL_REVIEW_PENDING`.

Common pin for all five sections: law `325AC0000000226` (地方税法), revision
`325AC0000000226_20261101_508AC0000000002`, raw snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
SHA-256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
The needles below were re-extracted independently from the primary source
(一次資料) and matched byte-for-byte after whitespace normalisation. Articles
and needles were checked against the existing `JapanTaxLaw/*.lean` names and
`TRANSCRIPTION_CHECK_REGISTRY.json` before selection; all five units are
`NOT_STARTED`, dependency-free, and carry no previously modelled needle at the
same article.

### LocalTax72_24_7UpTo4M.lean — 各事業年度の所得 年四百万円以下

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の二十四の七 (Num 72_24_7).
- Normative unit `NORM|e932cef31eb10a25dd172cb51adbc7ef69dfb6ada9e3d2c2d5644dba991d393f`.
- Needle 「各事業年度の所得のうち年四百万円以下の金額」; 四百万 = 4,000,000 yen,
  「以下」 is INCLUSIVE (`≤`), so 3,999,999 does not qualify and 4,000,000 does.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (3,999,999), `threshold_at` (4,000,000),
  `threshold_above` (4,000,001).
- Independent spec rewrites the trigger as `amount ≤ 4_000_000` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（各事業年度の所得 年四百万円以下）, T（四百万、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（税率・他の階層・他条項は非介入）.

### LocalTax72_25Over3Months.lean — 指定月数 三月超

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の二十五 (Num 72_25).
- Normative unit `NORM|93f4e10498152ac92f06409e2ac45cf8d103f6aba2ed5227ab3469334787defc`.
- Needle 「当該道府県知事が指定する三月を超える月数の期間内」; 三 = 3 months,
  「を超え」 is STRICT (`>`), so 3 does not trigger and 4 does.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (2), `threshold_at` (3), `threshold_above` (4).
- Independent spec rewrites the trigger as `amount > 3` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（指定月数 三月超）, T（三、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（指定手続・他の号・税率は非介入）.

### LocalTax144_21TwoOrMore.lean — 免税軽油使用者 二人以上の代表者

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百四十四条の二十一 (Num 144_21).
- Normative unit `NORM|a16e2a0ce65728a2f05d6e56349d0f114a8c9302f8e40d696b9c5d2e665bd5c1`.
- Needle 「この場合において、免税軽油使用者のうち当該道府県知事の承認を受けた者にあつては、二人以上の者が代表者を定めて免税軽油使用者証の交付を受けることができる。」;
  二 = 2 persons, 「以上」 is INCLUSIVE (`≥`), so 1 does not satisfy the floor
  and 2 does.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (1), `threshold_at` (2), `threshold_above` (3).
- Independent spec rewrites the trigger as `amount ≥ 2` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（免税軽油使用者 二人以上の代表者）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（承認手続・証の様式・他の号は非介入）.

### LocalTax20_5_2OverTwoMonths.lean — 延長期限 二月超禁止

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十条の五の二 (Num 20_5_2).
- Normative unit `NORM|cebb9b5c43f6020899062e4ec82e7c9ead3f073fae4269c78aea75cc3f321b38`.
- Needle 「この場合において、延長後の期限は、当該理由がなくなつた日から二月を超えてはならない。」;
  二 = 2 months, 「を超えてはならない」 is a STRICT ceiling (`>` beyond the
  ceiling is out of scope), so 2 is permitted and 3 exceeds the ceiling.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (1), `threshold_at` (2), `threshold_above` (3).
- Independent spec rewrites the trigger as `amount > 2` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（延長期限 二月超禁止）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（延長の理由・手続・他の条項は非介入）.

### LocalTax311TwoOrMore.lean — 前号の者を二人以上有する者

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百十一条 (Num 311).
- Normative unit `NORM|1ed1564cf1b491810255cf81def7dacb6a05d358ca056df51e2551048e6c65ec`.
- Needle 「前号に掲げる者を二人以上有する者」; 二 = 2 persons, 「以上」 is
  INCLUSIVE (`≥`), so 1 does not satisfy the floor and 2 does.
- Boundary categories: `zero` (0), `small_input` (1),
  `threshold_below` (1), `threshold_at` (2), `threshold_above` (3).
- Independent spec rewrites the trigger as `amount ≥ 2` with a universal
  axiom-free bridge; kernel-decided Bool examples cover all five categories.
- H/T/D/C/U: H（前号の者を二人以上有する者）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（前号の者の定義・他の号・控除額は非介入）.

## Status

All five reviews are mechanical, not human. Human legal review remains
`LEGAL_REVIEW_PENDING`; no approval is recorded.
