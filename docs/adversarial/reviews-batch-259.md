# Adversarial review — batch 259

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold / band normative units from the pinned 地方税法 snapshot.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov snapshot, scoped
to the cited article (and paragraph / item) rather than matched as a number
anywhere in the whole text. Articles and needles were checked against the
existing `JapanTaxLaw/*.lean` names, the transcription checks and
`data/TRANSCRIPTION_CHECK_REGISTRY.json` before selection; all five units are
`NOT_STARTED`, dependency-free, and none of their needles was previously
modelled. 「以上」 and 「以下」 are INCLUSIVE; 「を超え」 is STRICT;
「を超えることができない」 is an INCLUSIVE ceiling. The boundary examples are
kernel-decided, not asserted by prose. No statutory literal 1 is used as a
threshold value.

This document was produced mechanically by a script, not by a human reviewer;
it is a transcription/structure check only and is NOT legal approval.

### LocalTax28TwoAdjustmentParts.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第二十八条 (Num 28), paragraph 2, item 2 (附則).
- Normative unit `NORM|ef827c289e7b4b88b1011a0e07988bf544407dfd154373fd2f33f5ade4abd2aa`.
- Needle 「二以上の調整部分を有する宅地等で非調整部分を有しないもの」;
  二 = 2, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor and 2 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（二以上の調整部分の宅地等）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（非調整部分の除外判定、他の号・他条項は非介入）.

### LocalTax51StandardRateCeiling2.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第五十一条 (Num 51), paragraph 1.
- Normative unit `NORM|c6450946afa36af4ed52b19ff5433b84df5afb14341f23ab94d02f93d73b7450`.
- Needle 「ただし、標準税率を超える税率で課する場合においても、百分の二を超えることができない。」;
  二 = 2, 「を超えることができない」 is an INCLUSIVE ceiling (`≤ 2`), so 2 is
  permitted and 3 is prohibited. 「標準税率を超える税率で課する場合」 is the
  surrounding exception frame, not the modelled threshold.
- Boundaries: `inScopeBool 0 = true`, `1 = true` (below), `2 = true` (at),
  `3 = false` (above) — `zero`, `small_input`, `threshold_at`,
  `threshold_above` (4 categories).
- Independent spec rewrites the ceiling as `amount ≤ 2` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（標準税率超過課税の場合の百分の二上限）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界4区分, spec 独立）,
  U（標準税率そのもの、他の税率・他条項は非介入）.

### LocalTax7_2IncomeOver9M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七条の二 (Num 7_2), paragraph 2 (附則, table column).
- Normative unit `NORM|173f3086befe70ad8fce20705614f112024e97f394f82a7288a55061794155a5`.
- Needle 「九百万円を超える金額」;
  九 = 9, 「を超え」 is STRICT (`>`), so 9,000,000 is excluded and 9,000,001
  satisfies the threshold.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `8_999_999 = false` (below),
  `9_000_000 = false` (at), `9_000_001 = true` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `9_000_000 < amount` from statutory
  literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（九百万円を超える金額）, T（九、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（対応税率、他の表欄・他条項は非介入）.

### LocalTax72_24_7IncomeOver8M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の二十四の七 (Num 72_24_7), paragraph 1, item 3 (table column).
- Normative unit `NORM|ad52185987fff99ddb9f5dc7564d515a6847119b2ac2ce67cfc93effc1092877`.
- Needle 「各事業年度の所得のうち年八百万円を超える金額」;
  八 = 8, 「を超え」 is STRICT (`>`), so 8,000,000 is excluded and 8,000,001
  satisfies the threshold.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `7_999_999 = false` (below),
  `8_000_000 = false` (at), `8_000_001 = true` (above) — `zero`, `small_input`,
  `threshold_below`, `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `8_000_000 < amount` from statutory
  literals only (no impl identifier); universal axiom-free bridge
  (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（事業年度所得の年八百万円超過）, T（八、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（対応税率、他の表欄・他条項は非介入）.

### LocalTax9_2Band4MTo1B.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第九条の二 (Num 9_2), paragraph 1 (附則, quoted table column).
- Normative unit `NORM|85f4e8d8a317633f2b68dae17c596f8ece7ac63670d6fef5f57eff7b19593cec`.
- Needle 「各事業年度の所得のうち年四百万円を超え年十億円以下の金額」;
  四 = 4, 「を超え」 is STRICT lower (¥4,000,000 excluded), 「以下」 is
  INCLUSIVE upper (¥1,000,000,000 included). Both bounds come from the scoped
  needle, not from a whole-text number match.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `3_999_999 = false`
  (below_lower), `4_000_000 = false` (at_lower, strict), `4_000_001 = true`
  (above_lower), `1_000_000_000 = true` (at_upper, inclusive),
  `1_000_000_001 = false` (above_upper) — 7 categories.
- Independent spec rewrites the band as `Nat.succ 4_000_000 ≤ amount ∧
  amount ≤ 1_000_000_000` from statutory literals only (no impl identifier);
  universal axiom-free bridge (`agree_scope`) by `Nat.succ_le_of_lt` /
  `Nat.lt_of_succ_le`.
- H/T/D/C/U: H（事業年度所得の四百万円超十億円以下の帯）, T（四・十、bytes pinned）,
  D（普遍 bridge, succ/le 双方向, decide）, C（needle scoped, 境界7区分, spec 独立）,
  U（対応税率、他の表欄・他条項は非介入）.

All five checks above are mechanical re-extractions and structural/kernel
checks only. None of them constitutes a human legal review or approval;
`LEGAL_REVIEW_PENDING` remains recorded for every unit.
