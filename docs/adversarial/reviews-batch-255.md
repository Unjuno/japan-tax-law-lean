# Adversarial review — batch 255

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold normative units from the pinned 地方税法 snapshot.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov snapshot. Articles
and needles were checked against the existing `JapanTaxLaw/*.lean` names and
the transcription checks / `TRANSCRIPTION_CHECK_REGISTRY.json` before
selection; all five units are `NOT_STARTED`, dependency-free, and none of
their needles was previously modelled. 「以上」 and 「以下」 are INCLUSIVE;
「を超え」 is STRICT. The boundary examples below are kernel-decided, not
asserted by prose.

This document was produced mechanically by a script, not by a human reviewer;
it is a transcription/structure check only and is NOT legal approval.

### LocalTax53TwoPrefecturesNotice.lean — 法人の二以上の道府県届出通知

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`, article 第五十三条 (Num 53).
- Normative unit `NORM|be1a7221c6240de4540ea4692c0da43665924fca795d171d0e1240eb0ece0543`.
- Needle 「二以上の道府県において事務所又は事業所を有する法人の主たる事務所又は事業所所在地の道府県知事は、当該法人から前項の規定による届出があつた場合には、その旨を関係道府県知事に通知しなければならない。」;
  二 = 2, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（法人の二以上の道府県届出通知）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（通知・承認・按分の手続、他の号・他条項は非介入）.

### LocalTax72_48TwoAllocationBases.lean — 分割法人の二以上の分割基準

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`, article 第七十二条の四十八 (Num 72_48).
- Normative unit `NORM|a560ff959067b90c251085b623b796fdf623c4f123bb2bfb9f5e714e9ce2a9b8`.
- Needle 「分割法人が二以上の分割基準を適用すべき事業を併せて行う場合における当該分割法人の事業に係る課税標準額の総額の分割については、これらの事業のうち主たる事業について定められた分割基準によるものとする。」;
  二 = 2, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（分割法人の二以上の分割基準）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（通知・承認・按分の手続、他の号・他条項は非介入）.

### LocalTax72_49_16TwoPrefecturesApproval.lean — 個人の二以上の道府県区分計算の承認

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`, article 第七十二条の四十九の十六 (Num 72_49_16).
- Normative unit `NORM|230b05de0666f0599f78f9210937785b2b403e45e187b400caafa10d79355197`.
- Needle 「前項の場合においては、その区分計算の方法について、事務所又は事業所所在地の道府県知事（二以上の道府県において事務所又は事業所を設けて事業を行う個人にあつては、主たる事務所又は事業所所在地の道府県知事）の承認を受けなければならない。」;
  二 = 2, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（個人の二以上の道府県区分計算の承認）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（通知・承認・按分の手続、他の号・他条項は非介入）.

### LocalTax321_4TwoSpecialCollectors.lean — 二以上の特別徴収義務者の指定

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`, article 第三百二十一条の四 (Num 321_4).
- Normative unit `NORM|70b342b4ac472f997d7d9ce79f12f8aeb9aa2264f13e6b89ed284798106a86b9`.
- Needle 「この場合において、特別徴収義務者として二以上の者を指定したときは、給与所得に係る特別徴収税額をこれらの者が当該年度中にそれぞれ支払うべき給与の額に按分して、これを徴収させることができる。」;
  二 = 2, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（二以上の特別徴収義務者の指定）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（通知・承認・按分の手続、他の号・他条項は非介入）.

### LocalTax389TwoMunicipalitiesMovable.lean — 二以上の市町村にわたる移動性償却資産

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`, article 第三百八十九条 (Num 389).
- Normative unit `NORM|747032ecdd3d339cdd6c1faa2ecd7b59bc19351a77f853ed9a9e42e8c3936b50`.
- Needle 「総務省令で定める船舶、車両その他の移動性償却資産又は可動性償却資産で二以上の市町村にわたつて使用されるもののうち総務大臣が指定するもの」;
  二 = 2, 「以上」 is INCLUSIVE (`≥`), so 1 is below the floor
  and 2 satisfies it.
- Boundaries: `inScopeBool 0 = false`, `1 = false` (below), `2 = true` (at),
  `3 = true` (above) — `zero`, `small_input`, `threshold_below`,
  `threshold_at`, `threshold_above` (5 categories).
- Independent spec rewrites the trigger as `amount ≥ 2` from statutory
  literals only; universal axiom-free bridge (`agree_scope`) proved by `rfl`.
- H/T/D/C/U: H（二以上の市町村にわたる移動性償却資産）, T（二、bytes pinned）,
  D（普遍 bridge, rfl/decide）, C（needle scoped, 境界5区分, spec 独立）,
  U（通知・承認・按分の手続、他の号・他条項は非介入）.
